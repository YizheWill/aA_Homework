# String literal freezing comment
require 'sqlite3'
require 'singleton'

# this is the class to communicate with the sqlite3 database
class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    # returned data from the database will be the same data type as we what we feed it
    self.results_as_hash = true
    # results are rendered back as array, it's a built in for sqlite 3 to transform into hash
  end
end

# play class will create functions related to plays data manipulations
class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        plays
    SQL
    data.map do |p|
      Play.new(p)
    end
  end

  def initialize(options)
    @id, @title, @year, @playwright_id = options.values_at('id', 'title', 'year', 'playwright_id')
  end

  def create
    # if the id is already exist, we cannot create, as it's already in the db.
    raise "#{self} already in database" if @id

    PlayDBConnection.instance.execute(<<-SQL, title: @title, year: @year, playwright: @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (:title, :year, :playwright)
    SQL
    # prevent sql injection attack
    # playwright_id = "3; DROP TABLE plays"
    # this kind of table names are easy to find and we will lose everything.
    # sqlite3 will sanitize the input, will delete anything malicious. with the ? ? ? syntax, we are safe
    @id = PlayDBConnection.instance.last_insert_row_id
    # give us the id of the last inserted data's id.
  end

  def update
    raise "#{self} not in database" unless @id

    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
