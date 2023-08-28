# Class representing a person
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name, age = 'Unknown', parent_permission: true)
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
