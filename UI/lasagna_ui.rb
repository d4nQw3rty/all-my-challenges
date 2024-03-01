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
      puts ''
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
  end
end
