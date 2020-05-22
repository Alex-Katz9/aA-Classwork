require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'questions'
require_relative 'questions_database'

class Replies 
    attr_accessor :question_id, :parent_id, :replier_id
    attr_reader :id

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @replier_id = options['replier_id']
    end
    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless reply.length > 0
        Replies.new(reply.first) # question stored in array
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil unless reply.length > 0
        Replies.new(reply.first) # question stored in array
    end

    def self.find_by_parent_id(parent_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_id = ?
        SQL
        return nil unless reply.length > 0
        Replies.new(reply.first) # question stored in array
    end

    def self.find_by_replier_id(replier_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, replier_id)
            SELECT
                *
            FROM
                replies
            WHERE
                replier_id = ?
        SQL
        return nil unless reply.length > 0
        Replies.new(reply.first) # question stored in array
    end

    def author
        Users.find_by_id(self.replier_id)
    end
    def question
        Questions.find_by_id(self.question_id)
    end
    def parent_reply
        Replies.find_by_id(self.parent_id)
    end
    def child_replies
        Replies.find_by_parent_id(self.id)
    end
end