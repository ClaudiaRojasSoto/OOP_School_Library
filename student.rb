require_relative 'person'

# Class representing a student
class Student < Person
  def initialize(name, age, classroom, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
