require_relative "../styles/styles.rb"
class Menus
  include Styles

  def initialize
    @options_menu_1 = ["Hello World","Lasagna"]
  end
  attr_reader :options_menu_1
  def menu_1
    Styles.options(options_menu_1)  
  end
end
