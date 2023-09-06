require 'spec_helper'
require_relative '../book'

describe Book do
  it 'should have a title' do
    book = Book.new('Title', 'Author')
    expect(book.title).to eq('Title')
  end

  it 'should have an author' do
    book = Book.new('Title', 'Author')
    expect(book.author).to eq('Author')
  end

  describe '#initialize' do
    it 'creates a book with a title and author' do
      book = Book.new('1984', 'George Orwell')
      expect(book.title).to eq('1984')
      expect(book.author).to eq('George Orwell')
    end
  end

  describe '#to_h' do
    it 'returns the book title and author as a hash' do
      book = Book.new('1984', 'George Orwell')
      expect(book.to_h).to eq({ 'title' => '1984', 'author' => 'George Orwell' })
    end
  end
end
