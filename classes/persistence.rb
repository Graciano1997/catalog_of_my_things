require 'json'
require_relative 'book'
require_relative 'label'

class Persistance
  attr_reader :books
  def initialize
    unless Dir.exist?('db')
      Dir.mkdir('db')
      Dir.chdir('./db')
      `touch books.json`
      Dir.chdir('../')
    end
    @books = load_books || []
  end

  def load_books
  unless File.empty?('./db/books.json')
    book_base = JSON.parse(File.read('./db/books.json'))
    books = []
    book_base.each do |book|
      book_item = Book.new(book['publisher'], book['cover_state'],book['publish_date'])
      book_item.id=book['id']
      book_label = Label.new(book['title'],book['color'])
      book_label.id=book['id_label']
      book_item.label=book_label
      books << book_item
    end
  end
  @books = books
  end

  def book_hashed(books)
    book_objects = []
    books.each do |book|
      book_hash = {}
      book_hash['id'] = book.id.to_i
      book_hash['title'] = book.label.title.to_s
      book_hash['color'] = book.label.color.to_s
      book_hash['id_label'] = book.label.id.to_i
      book_hash['publisher'] = book.publisher.to_s
      book_hash['cover_state'] = book.cover_state.to_s
      book_hash['publish_date'] = book.publish_date
      book_objects << book_hash
    end
    book_objects
  end

  def save_all(books)
    File.write('./db/books.json', JSON.pretty_generate(book_hashed(books)), mode: 'w')
    # puts '***Saving all 📚📚 ...'
    # File.write('./db/people.json', JSON.pretty_generate(people_hashed(people)), mode: 'w')
    # puts '***Saving all people 👨👨 ...'
    # File.write('./db/rentals.json', JSON.pretty_generate(rentals_hashed(rentals)), mode: 'w')
    # puts '***Saving all rentals 👨💳 ...'
    # puts ' '
    # puts '________________________Saved 100% successfully ✅✅___________________________________________'
  end
end
