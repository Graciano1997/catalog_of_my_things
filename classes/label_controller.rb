require_relative 'label'
require_relative 'persistence'

class LabelController
  attr_accessor :list_all_labels, :label_db

  def initialize
    persistence_controller = Persistance.new
    @label_db = persistence_controller.labels
  end

  def list_all_labels
    if !@label_db.empty?
      @label_db.each do |label|
      puts "#{ @label_db.index(label)} -> | Id: #{label.id} | Title: #{label.title} | Color: #{label.color} |"
      end

    else
      puts "There is no Label in your Collection !"
    end
  end
end

# label_controller_object = LabelController.new
# label_controller_object.list_all_labels
