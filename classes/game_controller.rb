require_relative 'game'
require_relative 'author'
require_relative 'persistence'
require_relative 'author_controller'

class GameController
  attr_accessor :games_db, :author_db

  def initialize
    @games_db = []
    @author_db = []
  end

   def add_game
     puts ' '
     puts 'Run:: 👉 Creating New game____________________________________________🎮'
     puts ' '
     author_controller_object = AuthorController.new
     author_controller_object.list_all_authors
     puts ' '
     puts 'Please Ensure to press Enter to start adding a new Game' if @author_db.empty?
     puts "You can use one of the above author's option eg: 0 Or press Enter to ignore to create the new game's author" unless @author_db.empty?
     option = gets.chomp
     puts ' '
     if option.eql?('')
       puts "Please write the game's Author First Name"
       author_first_name = gets.chomp.to_s
       puts "Please write the game's Author Last Name"
       author_last_name = gets.chomp.to_s
      game_author = Author.new(author_first_name, author_last_name)
     else
       game_author = @author_db[option.to_i]
     end
     puts "Is it Multiplayer Game ? Type Yes or No"
     is_multiplayer_game = gets.chomp.to_s.downcase
     game_multiplayer = is_multiplayer_game.eql?("yes") ? true : false
     puts "Please write game's Published date eg: {2023-10-11}"
     game_publish_date = Date.parse(gets.chomp.to_s)
     puts "Please write the game's Last played date eg: {2022-10-11}"
     game_last_played_date = Date.parse(gets.chomp.to_s)
     game_item = Game.new(game_publish_date,game_multiplayer, game_last_played_date)
     game_author.add_item(game_item)
     game_item.author = game_author
     @games_db << game_item
     @author_db << game_author unless @author_db.include?(game_author)
     puts ' '

     puts 'Game item Created Successfully______________________________________🎮 ✅'
   end

  def list_all_games
    puts ' '
    puts 'Run:: 👇 List All Games_________________________________________________🎮'
    puts ' '
    if @games_db.empty?
      puts 'There is no game in your Collection !'
      puts 'You are welcome to add it! 🎮'
    else
      @games_db.each do |game|
        puts game.author.last_name
        puts "#{@games_db.index(game)} -> | Id: #{game.id} | Multiplayer: #{game.multiplayer} | Last_played_at: #{game.lastplayed_at} | Author's Id: #{game.author.id} | Author's name : #{game.author.first_name} | Publish Date : #{game.publish_date} | Archived : #{game.archived} |"
      end
      end
    puts ' '
    puts 'Game List Displayed Successfully____________________________________🎮 ✅'
  end
end
