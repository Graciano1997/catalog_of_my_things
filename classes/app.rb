require_relative 'label_controller'
require_relative 'book_controller'
require_relative 'genre_controller'
require_relative 'music_album_controller'
require_relative 'persistence'

class App
  attr_accessor :book_controller_object, :label_controller_object

  def initialize
    @persistence_controller = Persistance.new
    @book_controller_object = BookController.new
    @label_controller_object = LabelController.new
    @genre_controller_object = GenreController.new
    @music_album_controller_object = MusicAlbumController.new
    
    @genre_controller_object.genre_db = @persistence_controller.genres
    @music_album_controller_object.music_db = @persistence_controller.music_album
    @music_album_controller_object.genre_db = @persistence_controller.genres
    
    @book_controller_object.books_db = @persistence_controller.books
    @book_controller_object.label_db = @persistence_controller.labels
    @label_controller_object.label_db = @persistence_controller.labels

  end

  def call(option)
    case option
    when 1
      @book_controller_object.list_all_books
    when 2
      @label_controller_object.list_all_labels
    when 3
      book_controller_object.add_book
      @label_controller_object.label_db = @book_controller_object.label_db
    when 4
      @music_album_controller_object.list_all_musics
    when 5
      @genre_controller_object.list_all_genres
    when 6
       @music_album_controller_object.add_music
       @genre_controller_object.genre_db=@music_album_controller_object.genre_db
    when 0
      quit
    end
  end

  def quit
    @persistence_controller.save_all(@book_controller_object.books_db, @book_controller_object.label_db,@music_album_controller_object.music_db,@music_album_controller_object.genre_db)
    puts ' '
    puts ' '
    puts 'Thank you for using this App! 🙏🙏'
    puts ' '
    puts 'I hope you enjoyed the Using experience! 😍 🤩 🥳'
    puts ' '
    puts 'Please ⭐ on Github'
    puts ' '
  end
end
