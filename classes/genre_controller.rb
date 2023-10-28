require_relative 'genre'
require_relative 'persistence'

class GenreController
    attr_accessor :genre_db
    def initialize
        persistence_controller = Persistance.new
        @genre_db = persistence_controller.genres
    end

    def list_all_genres
        puts ' '
        puts 'Run:: 👇 List Genres Collection_________________________________________🎵'
        puts ' '

        if @genre_db.empty?
            puts ' '
            puts "UPPS there is no Genre in your Music's Collection !"
            puts ' '
        else
            @genre_db.each do |genre|
                puts "#{@genre_db.index(genre)} -> | Id: #{genre.id} | Genre: #{genre.name} | "
            end
        end
        puts ' '
        puts 'Genre List Displayed Successfully___________________________________✅ 🎵'
    end
end