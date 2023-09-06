require 'rspec'
require_relative '../teacher'

RSpec.describe Teacher do
  describe '#initialize' do
    it 'creates a teacher with a name, age, and specialization' do
      teacher = Teacher.new('John Doe', 30, 'Mathematics')

      expect(teacher.name).to eq('John Doe')
      expect(teacher.age).to eq(30)
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the teacher' do
      teacher = Teacher.new('John Doe', 30, 'Mathematics')

      expect(teacher.to_h).to include(
        'id' => teacher.id,
        'name' => 'John Doe',
        'age' => 30,
        'parent_permission' => true,
        'specialization' => 'Mathematics'
      )
    end
  end

  describe '#can_use_services?' do
    it 'always returns true for teachers' do
      teacher = Teacher.new('John Doe', 30, 'Mathematics')
      expect(teacher.can_use_services?).to be true
    end
  end
end
