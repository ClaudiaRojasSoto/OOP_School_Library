# this class represents the books
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    @rentals << Rental.new(date, self, person)
  end

  def to_h
    {
      'title' => @title,
      'author' => @author
    }
  end
end
