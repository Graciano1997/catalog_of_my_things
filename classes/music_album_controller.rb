require_relative 'music_album'
require_relative 'genre'
require_relative 'persistence'
require_relative 'genre_C'

class MusicAlbumController
    attr_accessor :genre_db, :music_db 

    def initialize
        @music_db = []
        @genre_db = []
    end

    def add_music
        puts ' '
        puts 'Run:: 👉 Creating New Music_Album__________________________________📖'
        puts ' '
        genre_controller_object = GenreController.new
        genre_controller_object.list_all_genres
        puts ' '
        puts 'Please Ensure to press Enter to start add ALbum Operation' if @genre_db.empty?
        puts "You can use one of the above genres's option eg: 0 Or press Enter to ignore to create the new Music Genre" unless @genre_db.empty?
        option = gets.chomp
        puts ' '
        if option.eql?('')
          puts "Please write Music_Album's name"
          music_title = gets.chomp.to_s
          music_genre = Genre.new(music_title)
        else
          music_genre = @genre_db[option.to_i]
        end
        puts "When did the music published"
        music_publishDate = gets.chomp.to_s
        puts "is the music released on spotify Type yes or NO"
        music_on_spotify = gets.chomp.to_s.downcase
    
        music_item = Music_Album.new(music_publishDate, music_on_spotify)
        music_genre.add_item(music_item)
        music_item.genre = music_genre
        @music_db << music_item
        @genre_db << music_genre unless @genre_db.include?(music_genre)
        puts ' '
        puts 'Music Created Successfully_________________________________📖 ✅'
      end

end