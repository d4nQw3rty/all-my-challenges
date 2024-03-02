require_relative '../challenges/lasagna/lasagna'
require_relative '../modules/lasagna_module'
require_relative '../styles/styles'
# class Lasagna
class LasagnaUi < Lasagna
  include Styles
  include LasagnaModule

  OPTIONS = [
    'Remaining minutes in oven',
    'Preparation time in minutes',
    'Total cooking time in minutes'
  ]

  def lasagna_menu
    LasagnaModule.lasagna_menu_header(OPTIONS)
    select = gets.chomp
    method_constructor(OPTIONS, select)
  end

  def method_constructor(options_array, select)
    if select == '0'
      puts ''
    elsif %w[1 2 3].include?(select)
      option = options_array[select.to_i - 1].split(' ').first.downcase
      send option
    else
      lasagna_menu
    end
  end

  def remaining
    LasagnaModule.lasagna_menu_header(OPTIONS)
    Styles.htitle('How long the Lasagna has been in the oven?')
    time_in_oven = gets.chomp.to_i
    remaining_calculator(time_in_oven)
    go_back
  end

  def remaining_calculator(time)
    if time.negative? || time.eql?(0)
      LasagnaModule.message('It is not a valid time!', OPTIONS)
    elsif time <= 40
      LasagnaModule.message("You have to wait #{remaining_minutes_in_oven(time)} minutes", OPTIONS)
    else
      LasagnaModule.message('TAKE IT OUT OF THE OVEN!', OPTIONS)
    end
  end

  def preparation
    LasagnaModule.lasagna_menu_header(OPTIONS)
    Styles.htitle('Enter number of layers')
    layers = gets.chop.to_i
    preparation_calculator(layers)
  end

  def preparation_calculator(layers)
    if layers.positive?
      LasagnaModule.message("The preparation time is #{preparation_time_in_minutes(layers)} minutes", OPTIONS)
    else
      LasagnaModule.message('Enter a valid value', OPTIONS)
    end
    go_back
  end

  def total
    LasagnaModule.lasagna_menu_header(OPTIONS)
    Styles.htitle('Enter lasagna quantity of layers')
    layers = gets.chomp.to_i
    time_in_oven(layers)
  end

  def time_in_oven(layers)
    LasagnaModule.lasagna_menu_header(OPTIONS)
    Styles.htitle('Enter lasagna time in oven')
    time = gets.chomp.to_i
    if layers.between?(1, 20) && time.between?(1, 40)
      total_time = total_time_in_minutes(number_of_layers: layers, actual_minutes_in_oven: time)
      LasagnaModule.message("Cooking time: #{total_time} minutes", OPTIONS)
    else
      LasagnaModule.message('Some values are invalid', OPTIONS)
    end
    go_back
  end

  def go_back
    back = gets
    lasagna_menu if back
  end
end
