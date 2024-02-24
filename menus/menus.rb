class Menus
  def initialize
    @options_menu_1 = ["Hello World","Lasagna"]
  end
  attr_reader :options_menu_1
  def menu_1
    options_menu_1.each_with_index do |option, index|
      puts "#{index+1} -> " + "#{option}" 
    end
  end
end
