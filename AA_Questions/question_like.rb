
require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'questions'
require_relative 'questions_database'
class Questions_Like
    attr_accessor :users_id, questions_id
    attr_reader :id

    def initialize(options)
        @id = options['id']
        @users_id = options['users_id']
        @questions_id = options['questions_id']
    end

    def self.find_by_id(id)
        like = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions_like
            WHERE
                id = ?
        SQL
        return nil unless like.length > 0
        Questions_Like.new(like.first) # question stored in array
    end

    def self.find_by_questions_id(questions_id)
        like = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
            SELECT
                *
            FROM
                questions_like
            WHERE
                questions_id = ?
        SQL
        return nil unless like.length > 0
        Questions_Like.new(like.first) # question stored in array
    end

    def self.find_by_users_id(users_id)
        like = QuestionsDatabase.instance.execute(<<-SQL, users_id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                users_id = ?
        SQL
        return nil unless like.length > 0
        Questions_Like.new(like.first) # question stored in array
    end
    def self.likers_for_question_id(question_id)
        likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        Select
            users.*
        FROM
            users
        JOIN
            question_likes ON questions.id = question_likes.question_id
        WHERE
            question_likes.question_id = ?
        SQL
    end
end