require_relative 'label_controller'
require_relative 'game_controller'
require_relative 'author_controller'
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
    @author_controller_object = AuthorController.new
    @game_controller_object = GameController.new

    @author_controller_object.author_db = @persistence_controller.authors
    @game_controller_object.author_db = @persistence_controller.authors
    @game_controller_object.games_db = @persistence_controller.games

    @genre_controller_object.genre_db = @persistence_controller.genres
    @music_album_controller_object.genre_db = @persistence_controller.genres
    @music_album_controller_object.music_db = @persistence_controller.music_album

    @book_controller_object.label_db = @persistence_controller.labels
    @label_controller_object.label_db = @persistence_controller.labels
    @book_controller_object.books_db = @persistence_controller.books
  end

  MENU_OPTION = {
    '1' => :list_all_books,
    '2' => :list_all_labels,
    '3' => :add_book_and_share_label_db,
    '4' => :list_all_musics,
    '5' => :list_all_genres,
    '6' => :add_music_and_share_genre_db,
    '7' => :list_all_games,
    '8' => :list_all_authors,
    '9' => :add_game_and_share_author_db,
    '0' => :quit
  }.freeze

  def call(option)
    send(MENU_OPTION[option.to_s])
  end

  def list_all_books
    @book_controller_object.list_all_books
  end

  def list_all_labels
    @label_controller_object.list_all_labels
  end

  def add_book_and_share_label_db
    @book_controller_object.add_book
    @label_controller_object.label_db = @book_controller_object.label_db
  end

  def list_all_musics
    @music_album_controller_object.list_all_musics
  end

  def list_all_genres
    @genre_controller_object.list_all_genres
  end

  def add_music_and_share_genre_db
    @music_album_controller_object.add_music
    @genre_controller_object.genre_db = @music_album_controller_object.genre_db
  end

  def list_all_games
    @game_controller_object.list_all_games
  end

  def list_all_authors
    @author_controller_object.list_all_authors
  end

  def add_game_and_share_author_db
    @game_controller_object.add_game
    @author_controller_object.author_db = @game_controller_object.author_db
  end

  def quit
    db_items = { 'books' => @book_controller_object.books_db,

                 'labels' => @book_controller_object.label_db,
                 'music_album' => @music_album_controller_object.music_db,
                 'genres' => @music_album_controller_object.genre_db,
                 'authors' => @game_controller_object.author_db,
                 'games' => @game_controller_object.games_db }

    @persistence_controller.save_all(db_items)
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
