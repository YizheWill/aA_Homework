require_relative 'questiondb'

# question table manipulations
class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    data = QuestionsDatabase.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
    SQL
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id, @title, @body, @author_id = options.values_at('id', 'title', 'body', 'author_id')
  end

  def self.find_by_id(id)
    data = QuestionsDatabase.execute(<<-SQL, id)
      SELECT * FROM questions WHERE id = ?
    SQL
    Question.new(data)
  end

  def self.find_by_author(author_id)
    data = QuestionsDatabase.execute(<<-SQL, author_id: author_id)
      SELECT * FROM questions WHERE author_id = :author_id
    SQL

    data.map { |question_data| Question.new(question_data) }
  end
end
