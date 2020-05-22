require_relative "employee"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end
    
    def salary
        @employees.map(&:salary).sum
    end

    
end