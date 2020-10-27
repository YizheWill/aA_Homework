require_relative 'questiondb'

class User
  attr_accessor :id, :fname, :lname, :is_instructor

  def self.find_by_id(id)
    p "here"
    user = QuestionsDatabase.execute(<<-SQL, id: id)
      SELECT users.* FROM users WHERE id = :id
    SQL
    p "there"
    user ? nil : User.new(user)
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.execute(<<-SQL, fname: fname, lname: lname)
      SELECT * FROM users WHERE fname = :fname AND lname = :lname
    SQL
    user ? nil : User.new(user)
  end

  def initialize(options)
    @id, @fname, @lname, @is_instructor = options.values_at('id', 'fname', 'lname', 'is_instructor')
  end
end
