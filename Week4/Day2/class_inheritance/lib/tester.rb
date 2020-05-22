require_relative "manager"
require_relative "employee"


b1 = Manager.new("b1", "m1", 32, nil)
e1 = Employee.new("e1", "t1", 20, b1)
e2 = Employee.new("e2", "t2", 50, b1)
