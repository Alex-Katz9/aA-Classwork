require 'sqlite3'
require 'singleton'
require_relative 'questions.rb'
require_relative 'questions_database'

# User.new({'fname' => 'Ned', 'lname' => 'Ruggeri'})

class Users
    attr_accessor :fname, :lname
    attr_reader :id
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0
        Users.new(user.first) # question stored in array
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless user.length > 0
        Users.new(user.first) # question stored in array
    end

    def authored_questions
        Questions.find_by_author_id(self.id)
    end

    def authored_replies
        Replies.find_by_replier_id(self.id)
    end
    
    def followed_questions
        Question_follows.followed_questions_for_user_id(self.id)
    end
end
