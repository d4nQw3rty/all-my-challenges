require_relative '../challenges/amusement-park-improvements/attendee'
require_relative '../challenges/amusement-park/attendee'
require_relative '../styles/styles'
require_relative '../modules/amusement_park_module'
# class AmusementParkUi
class AmusementParkUi
  include Styles
  include ApModule

  OPTIONS = {
    amp: ['Create Attendee'],
    attendee: ['Height', 'Pass ID', 'Fits Ride?', 'Allowed to ride?', 'Issue Pass!', 'Revoke Pass!']
  }

  def amusementpark_menu
    ApModule.amp_header(OPTIONS[:amp])
    amp_option = gets.chomp.downcase
    if amp_option == '1'
      create_attendee
    elsif amp_option == '0'
      puts ''
    else
      amusementpark_menu
    end
  end

  def create_attendee
    ApModule.amp_header(OPTIONS[:amp])
    Styles.htitle("Enter attendee's height in centimeters")
    attendee_height = gets.chomp.to_i
    if attendee_height.positive?
      attendee_creator(attendee_height)
    else
      puts 'Insert a valid value, example: 100'
      back = gets
      amusementpark_menu if back
    end
  end

  def attendee_creator(attendee_height)
    attendee = Attendee.new(attendee_height)
    attendee_menu(attendee)
  end

  def attendee_menu(attendee)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    select = gets.chomp.downcase
    if %w[1 2 3 4].include?(select)
      height_fitride_allowedride_passid(attendee, select)
    elsif %w[0 5 6].include?(select)
      issue_and_revoke(select, attendee)
    else
      attendee_menu(attendee)
    end
  end

  def height_fitride_allowedride_passid(attendee, select)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    case select
    when '1'
      ApModule.attendee_message("Attendee's height: #{attendee.height}")
    when '2', '3', '4'
      options = %i[pass_id pass_id_report fit_ride allowed_ride]
      option = options[select.to_i - 1]
      ApModule.send(option, attendee, OPTIONS[:attendee])
    end
    attendee_back(attendee)
  end

  def issue_and_revoke(select, attendee)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    if select == '0'
      amusementpark_menu
    elsif select == '5'
      issue(attendee)
    else
      revoke(attendee)
    end
  end

  def issue(attendee)
    if attendee.pass_id
      ApModule.attendee_message("You already have a Pass ID: #{attendee.pass_id}")
    else
      ApModule.attendee_message("Now you have a pass ID: #{attendee.issue_pass!(rand(1..1000))}")
    end
    attendee_back(attendee)
  end

  def revoke(attendee)
    if attendee.pass_id
      attendee.revoke_pass!
      ApModule.attendee_message('Yous pass was revoked!')
    else
      ApModule.attendee_message("You don't have a pass!")
    end
    attendee_back(attendee)
  end

  def allowed_ride(attendee)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    Styles.htitle('Enter minimun height for the ride')
    minimum_height = gets.chomp.to_i
    if attendee.allowed_to_ride?(minimum_height)
      ApModule.attendee_message('You shall pass!')
    else
      ApModule.attendee_message('You shall not pass!')
    end
  end

  def attendee_back(attendee)
    back = gets
    attendee_menu(attendee) if back
  end
end
