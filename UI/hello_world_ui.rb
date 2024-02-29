require_relative '../challenges/hello-world/hello_world'
require_relative '../styles/styles'

# class HelloWorldUi
class HelloWorldUi
  include Styles

  OPTIONS = ["Print 'Hello, World!'", 'Main menu']
  def initialize
    @str = HelloWorld.hello
  end

  attr_reader :str

  def helloworld_menu
    hello_header
    option = gets.chomp.downcase
    hello_world_case_constructor(option)
  end

  def hello_header
    Styles.clear
    Styles.htitle('Hello, World!')
    Styles.title('Options')
    Styles.line
    Styles.options(OPTIONS)
    Styles.footer
  end

  def hello_world_case_constructor(input)
    case input
    when '2'
      puts 'bye'
    when '1'
      message
      option = gets
      helloworld_menu if option
    else
      helloworld_menu
    end
  end

  def message
    hello_header
    Styles.htitle(HelloWorld.hello)
  end
end
