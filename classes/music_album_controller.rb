require 'date'
require_relative 'music_album'
require_relative 'genre'
# require_relative 'persistence'

class MusicAlbumController
    attr_accessor :genre_db, :music_db 

    def initialize
        @music_db = []
        @genre_db = []
    end

    def add_music
        puts ' '
        puts 'Run:: 👉 Creating New Music_Album__________________________________🎵'
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
        puts "Enter the published date eg: {2023-10-11}"
        music_publishDate = Date.parse(gets.chomp.to_s)
        puts "Is the music released on spotify ? Type Yes or No"
        is_music_on_spotify = gets.chomp.to_s.downcase
        music_on_spotify = is_music_on_spotify.eql?("yes") ? true : false
        music_element = MusicAlbum.new(music_publishDate, music_on_spotify)
        music_genre.add_item(music_element)
        music_element.genre = music_genre
        @music_db << music_element
        @genre_db << music_genre unless @genre_db.include?(music_genre)
        puts ' '
        puts 'Music Added Successfully____________________________________🎵 ✅'
      end

      def list_all_musics
        puts ' '
        puts 'Run:: 👉 List All Musics______________________________________🎵'
        puts ' '
        if @music_db.empty?
          puts 'There is no Music in your Collection !'
          puts 'You are welcome to add it! 🎵'
        else
          @music_db.each do |music|
            puts "#{@music_db.index(music)} -> | Id: #{music.id} | Genre's name: #{music.genre.name}  | Publish Date : #{music.publish_date} |"
          end
        end
        puts ' '
        puts 'Music List Displayed Successfully___________________________🎵 ✅'
      end

end