# this class represents the rental
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    return unless book && person # Return if book or person is nil

    @date = date
    @book = book
    @person = person

    book.rentals << self
  end

  def to_h
    {
      date: @date,
      book_title: @book.title,
      person_id: @person.id
    }
  end
end
