require_relative "menus/menus.rb"

class App

  def display
    
    clear
    menu = Menus.new
    menu.menu_1
    usr_option = gets.chop.downcase
  end

  def clear
    system("clear")
  end
end

app = App.new
app.display
