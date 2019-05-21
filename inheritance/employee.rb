require "byebug"
class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees
  def initialize(name,title,salary,boss)
    @employees = []
    super
  end

  def bonus_helper(emp)
    return emp.salary if !emp.is_a?(Manager)
   
    sum = emp.salary
    emp.employees.each do |ele|
      sum += bonus_helper(ele)
    end
    sum
  end

  def bonus(multiplier)
    employees_salaries = bonus_helper(self) - salary
    employees_salaries * multiplier
  end

  def add_employee(employee)
    @employees << employee
  end

  def inspect
    "<Employee #{self.name}>"
  end
end

ned = Manager.new("Ned", "Founder", 1000000, "")
darren = Manager.new("Darren","TA Managet", 78000,"Ned")

shawna = Employee.new("Shawna","TA", 12000, "Darren")
david = Employee.new("David","TA", 10000, "Darren")
darren.add_employee(shawna)
darren.add_employee(david)
ned.add_employee(darren)
# p david.bonus(3)
# p darren.bonus(4)
p ned.bonus(5)
