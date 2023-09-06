require_relative '../person'

RSpec.describe Person do
  describe '#initialize' do
    it 'creates a person with a name, age, and parent_permission' do
      person = Person.new('John Doe', 30, parent_permission: true)
      expect(person.name).to eq('John Doe')
      expect(person.age).to eq(30)
      expect(person.can_use_services?).to be true
    end
  end

  describe '#classroom=' do
    it 'adds a student to a classroom' do
      person = Person.new('John Doe')
      classroom = double('Classroom')
      expect(classroom).to receive(:add_student).with(person)
      person.classroom = classroom
    end
  end

  describe '#add_rentals' do
    it 'adds a rental to the person' do
      person = Person.new('John Doe')
      book = double('Book')
      allow(book).to receive(:rentals).and_return([]) # Mock empty rentals array
      allow(book).to receive(:rentals=) # Allow setting rentals
      date = '2023-09-05'
      expect { person.add_rentals(book, date) }.to change { person.rentals.length }.by(1)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the person' do
      person = Person.new('John Doe', 30, parent_permission: true)
      expect(person.to_h).to include(
        'id' => person.id,
        'name' => 'John Doe',
        'age' => 30,
        'parent_permission' => true
      )
    end
  end
end
