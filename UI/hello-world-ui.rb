require_relative "../challenges/hello-world/hello_world.rb"
require_relative "../styles/styles.rb"

class HelloWorldUi
  include Styles
      
  def initialize
    @str = HelloWorld.hello
  end

  attr_reader :str

  def hello_ui
    Styles.htitle("This will print 'Hello, World!' in the screen","Press a key to continue ->")
    hit_enter = gets
    Styles.htitle("#{HelloWorld.hello}")
    hit_enter = gets
    puts "Press a key to return"
  end
end
