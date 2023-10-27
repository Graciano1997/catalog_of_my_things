require_relative 'label'
require_relative 'persistence'

class LabelController
  attr_accessor :label_db

  def initialize
    persistence_controller = Persistance.new
    @label_db = persistence_controller.labels
  end

  def list_all_labels
    puts ' '
    puts 'Run:: 👉 List All Labels______________________________________🔖'
    puts ' '
    if @label_db.empty?
      puts ' '
      puts "UPPS there is no Label in your Book's Collection !"
      puts ' '
    else
      @label_db.each do |label|
        puts "#{@label_db.index(label)} -> | Id: #{label.id} | Title: #{label.title} | Color: #{label.color} |"
      end

    end
    puts ' '
    puts 'Labels List Displayed Successfully___________________________🔖 ✅'
  end
end
