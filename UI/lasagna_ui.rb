require_relative '../challenges/lasagna/lasagna'
require_relative '../styles/styles'
# class Lasagna
class LasagnaUi < Lasagna
  include Styles

  OPTIONS = [
    'Remaining minutes in oven',
    'Preparation time in minutes',
    'Total cooking time in minutes'
  ]

  def lasagna_menu
    lasagna_menu_header
    select = gets.chomp
    method_constructor(OPTIONS, select)
  end

  def method_constructor(options_array, select)
    case select
    when '0'
      puts 'Bye'
    when '1', '2', '3'
      option = options_array[select.to_i - 1].split(' ').first.downcase
      send option
    else
      lasagna_menu
    end
  end

  def remaining
    lasagna_menu_header
    Styles.htitle('How long the Lasagna has been in the oven?')
    time_in_oven = gets.chomp.to_i
    if time_in_oven.negative? || time_in_oven.eql?(0)
      message('It is not a valid time!')
    elsif time_in_oven <= 40 && time_in_oven.positive?
      message("You have to wait #{remaining_minutes_in_oven(time_in_oven)} minutes")
    else
      message('TAKE IT OUT OF THE OVEN!')
    end
  end

  def message(text)
    lasagna_menu_header
    Styles.htitle(text)
    back = gets
    lasagna_menu if back
  end

  def lasagna_menu_header
    Styles.clear
    Styles.htitle('Lasagna')
    Styles.title('Options')
    Styles.line
    Styles.options(OPTIONS)
    Styles.ltext('0 -> Main menu')
    Styles.footer
  end

  def preparation
    Styles.clear
    lasagna_menu_header
    Styles.htitle('Enter number of layers')
    layers = gets.chop.to_i
    preparation_calculator(layers)
  end

  def preparation_calculator(layers)
    if layers.positive?
      message("The preparation time is #{preparation_time_in_minutes(layers)} minutes")
    else
      message('Enter a valid value')
    end
    lasagna_menu
  end

  def total
    Styles.clear
    lasagna_menu_header
    Styles.htitle('Enter lasagna quantity of layers')
    layers = gets.chomp.to_i
    time_in_oven(layers)
  end

  def time_in_oven(layers)
    Styles.clear
    lasagna_menu_header
    Styles.htitle('Enter lasagna time in oven')
    time = gets.chomp.to_i
    if layers.between?(1, 20) && time.between?(1, 40)
      message("Cooking time: #{total_time_in_minutes(number_of_layers: layers, actual_minutes_in_oven: time)} minutes")
    else
      message('Some values are invalid')
    end
    lasagna_menu
  end
end
=======
require_relative '../styles/styles.rb'
require_relative '../challenges/lasagna/lasagna.rb'

class LasagnaUi < Lasagna 
 
 include Styles

  OPTIONS = [
    "Remaining minutes in oven",
    "Preparation Time",
    "Total Time",
    "Main Menu"
    ]
  
  def initialize
    @layers = 0
    @time_in_oven = 0
  end

  attr_reader :time_in_oven, :layer

  def lasagna_menu 
    system("clear")
    Styles.header
    Styles.title("Lest Prepare Lasagna!")
    Styles.footer  
    Styles.title( "OPTIONS")
    Styles.options(OPTIONS)   
    Styles.footer
    select = gets.chop.downcase
    if select == "1"
      remaining
    elsif select == "2"
      preparation
    elsif select == "3"
      total_time
    elsif select == "4"
      puts "main_menu"
    else
      lasagna_menu
    end

  end

  def remaining
    Styles.clear
    Styles.header
    Styles.title("How long the Lasagna has been in the oven?")
    Styles.footer
    time_in_oven = gets.chop.to_i
    if time_in_oven.negative? 
      Styles.header
      Styles.title("Put it in the oven!")
    Styles.footer
        
      back = gets
      lasagna_menu
    elsif time_in_oven <= 40 && time_in_oven.positive?
      Styles.header
      Styles.title("You have to wait #{remaining_minutes_in_oven(time_in_oven)} minutes")
    Styles.footer
      back = gets
      lasagna_menu
    else
      Styles.header
      Styles.title("TAKE IT OUT OF THE OVEN!")
    Styles.footer
      back = gets
      lasagna_menu
    end
  end

  def preparation
    system("clear")
    Styles.header
    Styles.title("Calculate your preparation time!")
    Styles.title( "Enter number of layers")
    Styles.footer
    
    layers = gets.chop.to_i
    if layers > 0
      Styles.header
      Styles.title("The preparation time is #{preparation_time_in_minutes(layers)} minutes")
      Styles.footer
      back = gets
      lasagna_menu
    else
      Styles.header
      Styles.title("Enter a valid value")
      Styles.footer
      back = gets
      lasagna_menu
    end
  end

  def total_time
    system("clear")
    Styles.header
    Styles.title("How long time preparing a lasagna?")
    Styles.title( "Enter quantity of layers")
    Styles.footer
    layers = gets.chop.to_i
    puts "Enter current time in oven"
    time_in_oven = gets.chop.to_i
    if layers.eql?(0) || time_in_oven.eql?(0) || time_in_oven.negative? || layers.negative? || time_in_oven > 40 || layers > 20
      Styles.header
      Styles.title("Some values are invalid")
    Styles.footer
      back = gets
      total_time
    else
      Styles.header
      Styles.title("Cooking time is #{total_time_in_minutes(number_of_layers: layers, actual_minutes_in_oven: time_in_oven)} minutes by now...")
    Styles.footer
      back = gets
      lasagna_menu
    end
  end
end