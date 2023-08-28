require_relative 'person'

# Class representing a student
class Teacher < Person
  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    trues
  end
end
