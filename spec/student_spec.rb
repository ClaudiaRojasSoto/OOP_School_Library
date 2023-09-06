require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  describe '#initialize' do
    it 'creates a student with a name, age, classroom, and parent_permission' do
      classroom = Classroom.new('Math')
      student = Student.new('Jane Doe', 16, classroom, parent_permission: false)

      expect(student.name).to eq('Jane Doe')
      expect(student.age).to eq(16)
      expect(student.classroom).to eq(classroom)
      expect(student.can_use_services?).to be false
    end
  end

  describe '#classroom=' do
    it 'adds a student to a classroom if not already added' do
      classroom = Classroom.new('Science')
      student = Student.new('Jane Doe', 20, classroom)

      new_classroom = Classroom.new('Math')
      expect(new_classroom.students).not_to include(student)

      student.classroom = new_classroom

      expect(new_classroom.students).to include(student)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the student' do
      classroom = Classroom.new('Math')
      student = Student.new('Jane Doe', 20, classroom)

      expect(student.to_h).to include(
        'id' => student.id,
        'name' => 'Jane Doe',
        'age' => 20,
        'parent_permission' => true,
        classroom: 'Math'
      )
    end
  end

  describe '#play_hooky' do
    it 'returns a hooky symbol' do
      classroom = Classroom.new('Math')
      student = Student.new('Jane Doe', 20, classroom)

      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
