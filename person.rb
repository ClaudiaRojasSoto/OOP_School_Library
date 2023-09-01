require_relative 'nameable'
require_relative 'decorator'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'
require_relative 'classroom'
require_relative 'rental'

# Class representing a person
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id, :classroom

  def initialize(name, age = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def add_rentals(book, date)
    @rentals << Rental.new(date, book, self)
  end

  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end

