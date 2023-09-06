require 'rspec'
require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  before do
    @book = Book.new('1984', 'George Orwell')
    @person = Person.new('John Doe', 30)
  end

  describe '#initialize' do
    it 'creates a rental with a date, book, and person' do
      rental = Rental.new('2023-09-05', @book, @person)

      expect(rental.date).to eq('2023-09-05')
      expect(rental.book).to eq(@book)
      expect(rental.person).to eq(@person)
    end

    it 'adds the rental to the book and person' do
      rental = Rental.new('2023-09-05', @book, @person)

      expect(@book.rentals).to include(rental)
      expect(@person.rentals).to include(rental)
    end

    it 'raises an error if book or person is missing' do
      expect { Rental.new('2023-09-05', nil, @person) }.to raise_error('Book and person are required')
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the rental' do
      rental = Rental.new('2023-09-05', @book, @person)

      expect(rental.to_h).to eq(
        date: '2023-09-05',
        book_title: '1984',
        person_id: @person.id
      )
    end
  end
end
