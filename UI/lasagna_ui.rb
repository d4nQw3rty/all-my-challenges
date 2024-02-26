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

