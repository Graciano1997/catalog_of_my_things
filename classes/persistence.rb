require 'json'
require_relative 'book'
require_relative 'label'
require_relative 'genre'
require_relative 'music_album'
require_relative 'game'
require_relative 'author'

class Persistance
  attr_accessor :labels, :books, :genres, :music_album, :games, :authors
  def initialize
    unless Dir.exist?('db')
      Dir.mkdir('db')
      Dir.chdir('./db')
      `touch books.json`
      `touch labels.json`
      `touch games.json`
      `touch authors.json`
      `touch musics.json`
      `touch genres.json`
      Dir.chdir('../')
    end
     @books = load_books || []
     @labels = load_labels || []
     @music_album = load_music_albums || []
     @genres = load_genres || []
     @authors = load_authors || []
     @games = load_games || []
  end

   def load_game_item(id)
     return if File.empty?('./db/games.json')
     game_base = JSON.parse(File.read('./db/games.json'))
     game_item = nil
     game_base.each do |game|
       if game['id'].to_i == id.to_i
         game_item = game
         break
       end
     end
     game_item
   end

   def load_music_album_item(id)
     return if File.empty?('./db/musics.json')
     music_base = JSON.parse(File.read('./db/musics.json'))
     music_item = nil
     music_base.each do |music|
       if music['id'].to_i == id.to_i
         music_item = music
         break
       end
     end
     music_item
   end

  def load_book_item(id)
    return if File.empty?('./db/books.json')
    book_base = JSON.parse(File.read('./db/books.json'))
    book_item = nil
    book_base.each do |book|
      if book['id'].to_i == id.to_i
        book_item = book
        break
      end
    end
    book_item
  end

  def load_labels
    unless File.empty?('./db/labels.json')
      label_base = JSON.parse(File.read('./db/labels.json'))
      labels = []
      label_base.each do |label|
        label_item = Label.new(label['title'], label['color'])
        label_item.id = label['id']
        label['items_id'].each do |item|
          next unless load_book_item(item)
          book_item_data = load_book_item(item)
          book_item = Book.new(book_item_data['publisher'], book_item_data['cover_state'],book_item_data['publish_date'])
          book_item.id = book_item_data['id']
          label_item.add_item(book_item)
        end
        labels << label_item
      end
    end
    @labels = labels
  end

   def load_authors
     unless File.empty?('./db/authors.json')
       author_base = JSON.parse(File.read('./db/authors.json'))
       authors = []
       author_base.each do |author|
         author_item = Author.new(author['first_name'], author['last_name'])
         author_item.id = author['id']
         author['items_id'].each do |item|
           next unless load_game_item(item)
           game_item_data = load_game_item(item)
           game_item = Game.new(game_item_data['publish_date'], game_item_data['multiplayer'],game_item_data['lastplayed_at'])
           game_item.id = game_item_data['id']
           author_item.add_item(game_item)
         end
         authors << author_item
       end
     end
     @authors = authors
   end

  def load_games
    unless File.empty?('./db/games.json')
      game_base = JSON.parse(File.read('./db/games.json'))
      games = []
        game_base.each do |game|
        game_item = Game.new(game['publish_date'], game['multiplayer'],game['last_played_at'])
        game_item.id = game['id']
        game_author = Author.new(game['first_name'], game['last_name'])
        game_author.id = game['id_author']
        game_item.author = game_author
        games << game_item
      end
    end
    @games = games
  end

  def load_books
    unless File.empty?('./db/books.json')
      book_base = JSON.parse(File.read('./db/books.json'))
      books = []
      book_base.each do |book|
        book_item = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        book_item.id = book['id']
        book_label = Label.new(book['title'], book['color'])
        book_label.id = book['id_label']
        book_item.label = book_label
        books << book_item
      end
    end
    @books = books
  end

  def load_genres
    unless File.empty?('./db/genres.json')
      genre_base = JSON.parse(File.read('./db/genres.json'))
      genres = []
      genre_base.each do |genre_item|
       genre_item_object = Genre.new(genre_item['name'])
       genre_item_object.id = genre_item['id']
        genre_item['items_id'].each do |item|
        next unless load_music_album_item(item)
        music_item_data = load_music_album_item(item)
          music_item = MusicAlbum.new(music_item_data['publish_date'],music_item_data['on_spotify'])
          music_item.id = music_item_data['id']
          genre_item_object.add_item(music_item)
         end
       genres << genre_item_object
   end
   @genres = genres
  end
 end

  def game_hashed(games)
    game_objects = []
    games.each do |game|
      game_hash = {}
      game_hash['id'] = game.id.to_i
      game_hash['multiplayer'] = game.multiplayer
      game_hash['last_played_at'] = game.lastplayed_at
      game_hash['id_author'] = game.author.id.to_i
      game_hash['first_name'] = game.author.first_name
      game_hash['last_name'] = game.author.last_name
      game_hash['publish_date'] = game.publish_date
      game_hash['archived'] = game.archived
      game_objects << game_hash
    end
    game_objects
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

  def label_hashed(labels)
    label_objects = []
    labels.each do |label|
      label_hash = {}
      label_hash['id'] = label.id.to_i
      label_hash['title'] = label.title.to_s
      label_hash['color'] = label.color.to_s
      items_key = []
      label.items.each do |item|
        items_key << item.id.to_i
      end
      label_hash['items_id'] = items_key
      label_objects << label_hash
    end
    label_objects
  end

  def author_hashed(authors)
    author_objects = []
    authors.each do |author|
      author_hash = {}
      author_hash['id'] = author.id
      author_hash['first_name'] = author.first_name
      author_hash['last_name'] = author.last_name
      items_key = []
      author.items.each do |item|
        items_key << item.id.to_i
      end
      author_hash['items_id'] = items_key
      author_objects << author_hash
    end
    author_objects
  end

  def genre_hashed(genres)
    genre_objects = []
    genres.each do |genre|
      genre_hash = {}
      genre_hash['id'] = genre.id.to_i
      genre_hash['name'] = genre.name.to_s
      items_key = []
      genre.items.each do |item|
        items_key << item.id.to_i
      end
      genre_hash['items_id'] = items_key
      genre_objects << genre_hash
    end
    genre_objects
  end

   def load_music_albums
     unless File.empty?('./db/musics.json')
       music_base = JSON.parse(File.read('./db/musics.json'))
       music_albums_item = []
       music_base.each do |music|
         music_item = MusicAlbum.new(music['publish_date'], music['on_spotify'])
         genre_item=Genre.new(music['genre'])
         genre_item.id=music['id_genre']
         music_item.id = music['id']
         music_item.genre=genre_item
         music_albums_item << music_item
       end
     end
     @music_albums = music_albums_item
   end

   def music_albums_hashed(music_albums)
     music_objects = []
     music_albums.each do |music_album|
       music_hash = {}
       music_hash['id'] = music_album.id.to_i
       music_hash['publish_date'] = music_album.publish_date
       music_hash['genre'] = music_album.genre.name
       music_hash['on_spotify'] = music_album.on_spotify
       music_hash['id_genre'] = music_album.genre.id.to_i
       music_objects << music_hash
     end
     music_objects
   end

   def save_all(books, labels,music_albums,genres,authors,games)
    puts ' '
    puts ' 😋 🤩 Saving Time.....................................'
    puts ' '
    puts 'Run:: 👉 Saving all Data______________________📚 🎵 🎮'
    puts ' '
    File.write('./db/books.json', JSON.pretty_generate(book_hashed(books)), mode: 'w')
    File.write('./db/labels.json', JSON.pretty_generate(label_hashed(labels)), mode: 'w')
    File.write('./db/musics.json', JSON.pretty_generate(music_albums_hashed(music_albums)), mode: 'w')
    File.write('./db/genres.json', JSON.pretty_generate(genre_hashed(genres)), mode: 'w') 
    File.write('./db/authors.json', JSON.pretty_generate(author_hashed(authors)), mode: 'w') 
    File.write('./db/games.json', JSON.pretty_generate(game_hashed(games)), mode: 'w') 
    puts 'Saving: 👉 75%'
    puts '________________________👉 Saved 100% 👈_______________'
    puts ' '
    puts 'successfull 👍 ✅'
    puts ' '
  end

end
