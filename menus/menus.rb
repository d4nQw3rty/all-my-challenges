require_relative "../styles/styles.rb"
class Menus
  include Styles

  def initialize
    @options_menu_1 = ["Hello World","Lasagna"]
  end
  attr_reader :options_menu_1
  def menu_1
    Styles.clear
    Styles.header
    Styles.options(options_menu_1) 
    Styles.ltext(" 0 -> Exit")
    Styles.ltext(" N -> Next Menu")
    Styles.footer
    select = gets
    if select.eql?("1")
      Styles.clear
      puts "Here comes the hello app"
    else
      Styles.clear
      menu_1
    end
  end
end
