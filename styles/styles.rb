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
end
