require_relative 'menus/menus'
# class App
class App
  def display
    clear
    menu = Menus.new
    menu.menu1
  end

  def clear
    system('clear')
  end
end

app = App.new
app.display
