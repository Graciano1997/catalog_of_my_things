require_relative 'book'
require_relative 'label'
require_relative 'persistence'

class BookController
  attr_accessor :books_db
  def initialize
    persistence_controller = Persistance.new
    @books_db = persistence_controller.books
  end

  def add_book
  puts "Please write Book's title"
  book_title=gets.chomp.to_s
  puts "Please write Book's Color"
  book_color=gets.chomp.to_s

  book_label=Label.new(book_title,book_color)

  puts "Please write Book's Publisher"
  book_publisher=gets.chomp.to_s
  puts "Please write Book's Cover state eg: {Good or Bad}"
  book_cover_state=gets.chomp.to_s.downcase
  puts "Please write Book's Publish date eg: {2023-10-11}"
  book_publish_date=Date.parse(gets.chomp.to_s)

  book_item= Book.new(book_publisher,book_cover_state,book_publish_date)
  book_label.add_item(book_item)
  book_item.label = book_label
  @books_db << book_item
end

# def list_all_books

# end

end

book_controller_object = BookController.new
puts book_controller_object.books_db[0].cover_state
