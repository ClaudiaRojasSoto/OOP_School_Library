# classroom_spec.rb
require 'rspec'
require_relative '../classroom'
require_relative '../person'

RSpec.describe Classroom do
  describe '#initialize' do
    it 'creates a classroom with a label' do
      classroom = Classroom.new('Math 101')
      expect(classroom.label).to eq('Math 101')
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new('Math 101')
      student = Person.new('John Doe')
      classroom.add_student(student)

      expect(classroom.students).to include(student)
      expect(student.classroom).to eq(classroom)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the classroom' do
      classroom = Classroom.new('Math 101')
      student1 = Person.new('John Doe')
      student2 = Person.new('Jane Doe')
      classroom.add_student(student1)
      classroom.add_student(student2)

      expect(classroom.to_h).to eq(
        'label' => 'Math 101',
        'students' => [student1.id, student2.id]
      )
    end
  end
end
