require_relative 'book'
require_relative 'label'
require_relative 'persistence'
require_relative 'label_controller'

class BookController
  attr_accessor :books_db, :list_all_books, :label_db

  def initialize
    persistence_controller = Persistance.new
    @books_db = persistence_controller.books
    @label_db = persistence_controller.labels
  end

  def add_book
    label_controller_object=LabelController.new
    label_controller_object.list_all_labels
    puts ' '
    puts "You can re-use one of the above label's option EG: 0 or press Enter to ignore and  creating new Book's Label"
    option=gets.chomp
    if !option.eql?("")
      book_label = @label_db[option.to_i]
    else
      puts "Please write Book's title"
      book_title = gets.chomp.to_s
      puts "Please write Book's Color"
      book_color = gets.chomp.to_s
      book_label = Label.new(book_title, book_color)
    end

    puts "Please write Book's Publisher"
    book_publisher = gets.chomp.to_s
    puts "Please write Book's Cover state eg: {Good or Bad}"
    book_cover_state = gets.chomp.to_s.downcase
    puts "Please write Book's Publish date eg: {2023-10-11}"
    book_publish_date = Date.parse(gets.chomp.to_s)

    book_item = Book.new(book_publisher, book_cover_state, book_publish_date)
    book_label.add_item(book_item)
    book_item.label = book_label
    @books_db << book_item
    @label_db << book_label unless @label_db.include?(book_label)
  end

  def list_all_books
    if !@books_db.empty?
      @books_db.each do |book|
      puts "#{ @books_db.index(book)} -> | Id: #{book.id} | Title: #{book.label.title} | Color: #{book.label.color} | Publisher: #{book.publisher} | Cover state : #{book.cover_state} | Publish Date : #{book.cover_state} |"
      end
    else
        puts "There is no Book in your Collection !"
        puts "You are welcome to add it!"
    end
  end
end

book_controller_object = BookController.new
book_controller_object.add_book

 persistence_controller = Persistance.new
 persistence_controller.save_all(book_controller_object.books_db,book_controller_object.label_db)
