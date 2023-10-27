require_relative 'label_controller'
require_relative 'book_controller'
require_relative 'persistence'

class App
  attr_accessor :book_controller_object, :label_controller_object
  def initialize
    @persistence_controller=Persistance.new
    @book_controller_object=BookController.new
    @label_controller_object=LabelController.new
    @book_controller_object.books_db=@persistence_controller.books
    @book_controller_object.label_db=@persistence_controller.labels
    @label_controller_object.label_db=@persistence_controller.labels
  end

  # MENU_OPTION = {
  #   '1' => -> { self.book_controller_object },
  #   # '2' => 'list_all_labels',
  #   # '3' => 'add_book',
  #   # '4' => "coming soon",
  #   # '5' => "coming soon",
  #   # '6' => "coming soon",
  #   # '7' => "coming soon",
  #   # '8' => "coming soon",
  #   # '9' => "coming soon",
  #   '0' => :quit
  # }.freeze

  def call(option)
    case option
    when 1
    self.book_controller_object.list_all_books
    when 2
    self.label_controller_object.list_all_labels
    when 3
    self.book_controller_object.add_book
    @label_controller_object.label_db=@book_controller_object.label_db
    when 0
      self.quit
    end
  end

  def quit
    @persistence_controller.save_all(@book_controller_object.books_db, @book_controller_object.label_db)
    puts ' '
    puts 'Thank you for using this App! 🙏🙏'
    puts ' '
    puts 'I hope you enjoy this App! 😍🤩🥳'
    puts ' '
    puts 'Please 🌟🌟💫✨ on Github'
    puts ' '
  end


end

# app=App.new

# # app.book_controller_object.add_book
# app.call(0)