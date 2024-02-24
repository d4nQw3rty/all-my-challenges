require_relative "menus/menus.rb"

class App

  def display
    
    clear
    menu = Menus.new
    menu.menu_1
    usr_option = gets.chop.downcase
    case usr_option
    when "1"
      clear
      puts "here is Hello World UI"
      back = gets
      display
    when "2"
      clear
      puts "Here lasagna UI"
      back = gets
      display
    when "0"
      puts "Good bye"
    when "n", "N"
      puts "here next menu"
      back = gets
      display
    else
      display
    end
  end

  def clear
    system("clear")
  end
end

app = App.new
app.display
