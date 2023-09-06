require 'json'
require 'fileutils'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    FileUtils.mkdir_p('./data')
    @books = []
    @people = []
    @rentals = []
    load_from_files
  end

  def list_books
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def list_people
    @people.each { |person| puts "#{person.class}: Name: #{person.name}, Id: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      student = create_student
      @people << student
      puts 'Student created successfully'
    when '2'
      teacher = create_teacher
      @people << teacher
      puts 'Teacher created successfully'
    else
      puts 'Invalid option'
    end
  end

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Classroom: '
    classroom_name = gets.chomp
    classroom = Classroom.new(classroom_name)

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    Student.new(name, age, classroom, parent_permission: parent_permission)
  end

  def create_teacher
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp.to_i

    print 'Specialization: '
    specialization = gets.chomp

    Teacher.new(name, age, specialization)
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}" }

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number:'
    @people.each_with_index { |person, index| puts "#{index}) #{person.name}" }

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    print 'Enter person id: '
    person_id = gets.chomp.to_i

    rentals = @rentals.select { |rental| rental.person.id == person_id }

    if rentals.empty?
      puts 'No rentals found for the given person id.'
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def exit_app
    puts 'Exiting the application. Goodbye!'
    save_to_files # agrega esta
    exit
  end

  # Add new functions to handle JSON
  def save_to_files
    File.write('./data/books.json', JSON.dump(@books.map(&:to_h)))
    File.write('./data/people.json', JSON.dump(@people.map(&:to_h)))
    rental_data = @rentals.map(&:to_h)
    File.write('./data/rentals.json', JSON.dump(rental_data))
  end

  def load_from_files
    @books = load_data('./data/books.json') { |book| Book.new(book['title'], book['author']) }

    @people = load_data('./data/people.json') do |person|
      new_person = Person.new(person['name'], person['age'])
      new_person.id = person['id']
      new_person
    end

    @rentals = load_data('./data/rentals.json') do |rental|
      book = @books.find { |b| b.title == rental['book_title'] }
      person = @people.find { |p| p.id == rental['person_id'] }
      Rental.new(rental['date'], book, person) if book && person
    end.compact
  end

  def load_data(file_name, &block)
    return [] unless File.exist?(file_name)

    json_data = JSON.parse(File.read(file_name))
    json_data.map(&block)
  end
end
