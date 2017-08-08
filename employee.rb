class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name,title,salary,boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    self.add_to_boss_emps
  end

  def add_to_boss_emps
    if boss != nil
      boss.employees << self
    end
  end
  def display
    [@name, @title, @salary, @boss]
  end
  def bonus(multiplier)
    @bonus = @salary*multiplier
  end
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end
  def display
    [@name, @title, @salary, @boss.name, @employees]
  end

  def bonus(multiplier)
    total_salary * multiplier
  end

  def total_salary
    cash = 0

    self.employees.each do |emp|

      unless emp.is_a? (Manager)
        cash += emp.salary
      else
        cash += (emp.total_salary+emp.salary)
      end
    end
    cash
  end
end

ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
darren = Manager.new('Darren', 'TA Manager', 78_000, ned)
shawna = Employee.new('Shawna', 'TA', 12_000, darren)
david = Employee.new('David', 'TA', 10_000, darren)

p ned.bonus(1.5)
