class Menus
  def initialize
    @options_menu_1 = "hello, World"
  end
  attr_reader :options_menu_1
  def menu_1
    puts options_menu_1
  end
end
