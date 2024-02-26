require_relative "../challenges/amusement-park/attendee.rb"
require_relative "../styles/styles.rb" 

class AmusementParkUi
  include Styles

  OPTIONS = {
    amp: ["Create Attendee", "Go back"],
    attendee: ["Height", "Pass ID", "Issue Pass", "Revoke Pass"]
  }

  def amusement_menu
    amp_header
    Styles.title("OPTIONS")
    Styles.options(OPTIONS[:amp])
    Styles.footer
    amp_option = gets.chomp.downcase
    case amp_option
    when "1"
      create_attendee
    when "2"
      puts "You Exit"
    else
      Styles.clear
      amusement_menu
    end
  end

  def create_attendee
    Styles.clear
    amp_header
    Styles.htitle("Lets create an atendee!","Enter attendee's height in centimeters")
    attendee_height = gets.to_i
    if  attendee_height > 0
      attendee = Attendee.new(attendee_height)
      attendee_menu(attendee)
    else
      puts "Insert a valid value, example: 100"
      error = gets
    end
  end

  def attendee_menu(attendee)
    attendee_menu_header
    check_option = gets.chomp.downcase
    case check_option
    when "0"
      puts "bye"
    when "1"
      attendee_menu_header
      Styles.line
      Styles.ltext("Attendee's Height is: #{attendee.height}")
      Styles.footer
      check_options = gets
      attendee_menu(attendee)
    when "2"
      attendee_menu_header
      Styles.line
      if attendee.pass_id.nil?
        attendee_message("Pass ID: nil ") 
      else
        attendee_message("Pass ID: #{attendee.pass_id} ") 
      end
      check_options = gets
      attendee_menu(attendee)
    when "3"
      attendee_menu_header
      Styles.line
      if attendee.pass_id.nil?
        attendee.issue_pass!(rand(1..1000))
        attendee_message("Now you have a pass ID: #{attendee.pass_id}") 
        check_option = gets
      else
        attendee_message("You already have a Pass ID: #{attendee.pass_id}")
        check_option = gets
      end
      attendee_menu(attendee)
    when "4"
      attendee_menu_header
      if attendee.pass_id.nil?
        puts "no"
      check_option = gets
      attendee_menu(attendee)
      else
        puts "yesp"
      check_option = gets
      attendee_menu(attendee)
      end
      attendee_menu(attendee)
    else
    end
  end

  def  attendee_menu_header
     Styles.clear
    amp_header
    Styles.title("OPTIONS")
    Styles.options(OPTIONS[:attendee])
    Styles.footer
  end
  
  def attendee_message(message)
    Styles.ltext(message)
    Styles.footer
  end

  def amp_header
    Styles.htitle("Amusement Park")
  end
end
