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
end
