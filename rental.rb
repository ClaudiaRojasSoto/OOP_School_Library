# this class represents the rental
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    return unless book && person # Return if book or person is nil

    @date = date
    @book = book
    @person = person

    book.rentals << self
    person.rentals << self
  end

  # Método añadido para convertir el objeto a hash
  def to_h
    {
      date: @date,
      book_title: @book.title, # Usando el título del libro como un identificador único
      person_id: @person.id # Suponiendo que las personas tienen un ID único
    }
  end
end
