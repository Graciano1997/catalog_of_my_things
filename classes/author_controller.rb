require_relative 'author'
require_relative 'persistence'

class AuthorController
  attr_accessor :author_db
  def initialize
    @author_db = []
  end

  def list_all_authors
    puts ' '
    puts "Run:: 👇 List of Games's Authors_______________________________________👤"
    puts ' '
    if @author_db.empty?
      puts ' '
      puts "UPPS there is no Authors in your Game's Collection !"
      puts ' '
    else
      @author_db.each do |author|
        puts "#{@author_db.index(author)} -> | Id: #{author.id} | First Name: #{author.first_name} | Last Name: #{author.last_name} |"
      end
    end
    puts ' '
    puts "Games Authors List Displayed Successfully_______________________👤_🎮_✅"
  end
end
