require_relative "menus/menus.rb"
class App
  
  def display
    system("clear")
    menu = Menus.new
    puts "WELCOME"
    stop = gets.chomp.to_i
    if stop.eql?(1)
      clear
      menu.menu_1
      back = gets
      display
    elsif stop.eql?(2)
      clear
      puts "Good bye"
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
