require_relative "hello_world.rb"
require_relative "../../styles/styles.rb"

class HelloWorldUi
  include Styles
      
  def initialize
    @str = HelloWorld.hello
  end

  attr_reader :str

  def hello_ui
    Styles.header
    Styles.title("This will print 'Hello, World!' in the screen")
    Styles.title("Press a key to continue ->")
    Styles.footer
    hit_enter = gets
    Styles.header
    Styles.title("#{HelloWorld.hello}")
    Styles.footer
    hit_enter = gets
    puts "Press a key to return"
  end
end
