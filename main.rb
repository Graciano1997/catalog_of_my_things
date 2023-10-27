require_relative 'classes/app'
require_relative 'classes/userinterface'

class Main
  def main
    app = App.new
    menu = UserInterface.new
    loop do
      menu.show
      app.call(menu.option) if (0..9).include?(menu.option)
      break if menu.option.zero?
    end
  end
end

catalog_controller = Main.new
catalog_controller.main
