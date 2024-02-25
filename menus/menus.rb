require_relative "../styles/styles.rb"
require_relative "../challenges/hello-world/hello-world-ui.rb"
require_relative "../challenges/lasagna/lasagna_ui.rb"
require_relative "../UI/amusement_park_ui.rb" 
class Menus
  include Styles

  def initialize
    @options_menu_1 = ["Hello World", "Lasagna", "Amusement Park"]
  end
  attr_reader :options_menu_1
  def menu_1
    Styles.clear
    Styles.header
    Styles.title("All My Challenges")
    Styles.footer
    Styles.header
    Styles.title("OPTIONS")
    Styles.options(options_menu_1) 
    Styles.ltext(" 0 -> Exit")
    Styles.ltext(" N -> Next Menu")
    Styles.footer
    select = gets.chop.downcase
    case select
    when "1"
      Styles.clear
      message = HelloWorldUi.new
      message.hello_ui
      menu_1
    when "2"
      Styles.clear
      lasagna = LasagnaUi.new
      lasagna.lasagna_menu
      menu_1
    when "3"
      Styles.clear
      attendee = AmusementParkUi.new
      attendee.amusement_menu
      menu_1
    when "0"
      Styles.clear
      puts "GOOD BYE !"
    else
      menu_1
    end
  end
end
