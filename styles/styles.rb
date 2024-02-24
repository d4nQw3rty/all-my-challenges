module Styles
  
  LINE =  "\n"
  SIDE = "|"
  MENU_TOP = " ="*30
  CW = MENU_TOP.length 
  SEPARATION = SIDE + " "*(MENU_TOP.length-1) + SIDE

  def self.header
    puts MENU_TOP
    puts SEPARATION
  end
  
  def self.title(text)
    puts SIDE + text.center(CW-1) + SIDE
  end

  def self.footer
    puts SEPARATION
    puts MENU_TOP
  end
  
  def self.ltext(text)
    puts SIDE + text.ljust(CW-1) + SIDE
  end
  
  def self.rtext(text)
    puts SIDE + text.rjust(CW-1) + SIDE
  end

  def self.line(text)
    puts SIDE + text.ljust(CW-1) + SIDE
  end

  def self.options(input)
    input.each_with_index do |option, index|
      puts SIDE + " #{index + 1} -> " + option.ljust(CW-7) + SIDE
    end
  end

  def self.clear
    system("clear")
  end
end
