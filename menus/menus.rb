require_relative '../styles/styles'
require_relative '../challenges/lasagna/lasagna_ui'
require_relative '../UI/amusement_park_ui'
require_relative '../UI/hello-world-ui'
# class Menus
class Menus
  include Styles

  def initialize
    @options_menu1 = [
      'Hello World',
      'Lasagna',
      'Amusement Park',
      'Exit'
    ]
  end
  attr_reader :options_menu1

  def menu1
    menu1_header
    select = gets.chop.downcase
    case_construct(select)
  end

  def menu1_header
    Styles.clear
    Styles.header
    Styles.title('All My Challenges')
    Styles.footer
    Styles.title('Options')
    Styles.line
    Styles.options(options_menu1)
    Styles.ltext('0 -> Exit')
    Styles.ltext('N -> Next Menu')
    Styles.footer
  end

  def case_construct(select)
    case select
    when '0'
      puts 'Bye'
    when '1', '2', '3'
      case_options(select)
      menu1
    else
      menu1
    end
  end

  def case_options(input)
    names = class_name(input)
    instance = Object.const_get(names.first).new
    instance.send names.last
  end

  def class_name(input)
    class_n = options_menu1[input.to_i - 1].split(' ').join << 'Ui'
    method_n = options_menu1[input.to_i - 1].split(' ').join << '_menu'
    [class_n, method_n.downcase]
  end
end
