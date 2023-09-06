# This class is for the classroom
class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    return if @students.include?(student) # Avoid duplicates

    @students << student
    student.classroom = self unless student.classroom == self # Check to avoid recursion
  end

  def to_h
    {
      'label' => @label,
      'students' => @students.map(&:id)
    }
  end
end
