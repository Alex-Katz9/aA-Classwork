require 'sqlite3'
require 'singleton'
require_relative 'users'
require_relative 'questions'
require_relative 'questions_database'
class Question_follows 

    attr_accessor :users_id, :questions_id
    attr_reader :id
    def initialize(options)
        @id = options['id']
        @users_id = options['users_id']
        @questions_id = options['questions_id']
    end

    def self.find_by_id(id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless question_follows.length > 0
        Question_follows.new(question_follows.first) # question stored in array
    end

     def self.find_by_users_id(users_id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, users_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                users_id = ?
        SQL
        return nil unless question_follows.length > 0
        Question_follows.new(question_follows.first) # question stored in array
    end

    def self.find_by_questions_id(questions_id)
        question_follows = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                questions_id = ?
        SQL
        return nil unless question_follows.length > 0
        Question_follows.new(question_follows.first) # question stored in array
    end

    def self.followers_for_question_id(questions_id)
        users = QuestionsDatabase.instance.execute(<<-SQL, questions_id)
            Select 
                users.*
            FROM 
                users
            JOIN 
                question_follows 
            ON users.id = question_follows.users_id
            WHERE
                question_follows.questions_id = ?
            SQL
        arr = []    
        users.each do |user|
            arr << Users.new(user) 
        end
        arr  
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            Select 
                questions.*
            FROM 
                questions
            JOIN 
                question_follows 
            ON questions.id = question_follows.questions_id
            WHERE
                question_follows.users_id = ?
            SQL
        arr = []    
        questions.each do |question|
            arr << Questions.new(question)
        end
        arr     
    end

    def self.most_followed_questions(n)
        num_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT questions.body
            FROM questions
            JOIN question_follows
            ON questions.id = question_follows.questions_id
            GROUP BY questions.id
            ORDER BY COUNT(questions.id) DESC
            LIMIT ?
        SQL
    end
end


