require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'questions_database'
class Questions
    attr_accessor :title, :body, :author_id
    attr_reader :id
    
    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0
        Questions.new(question.first) # question stored in array
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless question.length > 0
        Questions.new(question.first) # question stored in array
    end

    def author
        Users.find_by_id(self.author_id)
    end
    def replies
        Replies.find_by_question_id(self.id)
    end
    def followers
        Question_follows.followers_for_question_id(self.id)
    end

    def most_followed(n)
        Question_follows.most_followed_questions(n)
    end
end
