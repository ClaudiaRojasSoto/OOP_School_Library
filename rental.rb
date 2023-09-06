# this class represents the rental
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    raise 'Book and person are required' unless book && person # Cambio aquí

    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self unless person.rentals.include?(self) # Cambio aquí
  end

  def to_h
    {
      date: @date,
      book_title: @book.title,
      person_id: @person.id
    }
  end
end
