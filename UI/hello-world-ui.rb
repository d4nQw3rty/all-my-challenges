require_relative "../challenges/hello-world/hello_world.rb"
require_relative "../styles/styles.rb"

class HelloWorldUi
  include Styles
      
  OPTIONS = ["Print 'Hello, World!'","Main menu" ]
  def initialize
    @str = HelloWorld.hello
  end

  attr_reader :str

  def hello_ui
    hello_header
    options = gets.chomp.downcase
    case options
    when "2"
      puts "bye"
    when "1"
      hello_header
      Styles.htitle("#{HelloWorld.hello}")
      options = gets.chomp.downcase
      hello_ui
    else
      hello_ui
    end
  end

  def hello_header
    Styles.clear
    Styles.htitle("Hello, World!")
    Styles.title("Options")
    Styles.line
    Styles.options(OPTIONS)
    Styles.footer
  end
end
