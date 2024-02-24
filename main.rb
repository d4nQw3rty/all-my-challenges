require_relative "menus/menus.rb"
class App
  
  def display
    system("clear")
    menu = Menus.new
    puts "WELCOME"
    stop = gets.chomp.to_i
    if stop.eql?(1)
      menu.menu_1
      back = gets
      display
    elsif stop.eql?(2)
      puts "Good bye"
    else
      display
    end
  end
  display
end

app = App.new
app.display
