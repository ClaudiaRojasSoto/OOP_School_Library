# this class represents the rental
class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end
end
