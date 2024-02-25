require_relative "../challenges/amusement-park/attendee.rb"
require_relative "../styles/styles.rb" 

class AmusementParkUi
  include Styles

  OPTIONS = [
    "Height",
    "Pass ID",
    "Issue Pass",
    "Revoke Pass"
  ]

  def amusement_menu
    Styles.clear
    Styles.header
    Styles.title("Amusement Park")
    Styles.footer
    Styles.title("Lets create an atendee!")
    Styles.title("Enter attendee height in centimeter")
    Styles.footer
    select = gets.chop.to_i
    if  select > 0
      attendee = Attendee.new(select)
      Styles.clear
      Styles.header
      Styles.title("Amusement Park")
      Styles.footer
      Styles.header
      Styles.ltext("Attendee create")
      Styles.footer
      attendee_stop = gets
      amusement_menu
    else
      puts "Insert a valid value, example: 100 #{}"
      error = gets
    end
  end
end
