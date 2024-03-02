require_relative '../challenges/amusement-park/attendee'
require_relative '../styles/styles'
require_relative '../modules/amusement_park_module'
# class AmusementParkUi
class AmusementParkUi
  include Styles
  include ApModule

  OPTIONS = { amp: ['Create Attendee'], attendee: ['Height', 'Pass ID', 'Issue Pass!', 'Revoke Pass!'] }

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
      create_attendee if back
    end
  end

  def attendee_creator(attendee_height)
    attendee = Attendee.new(attendee_height)
    attendee_menu(attendee)
  end

  def attendee_menu(attendee)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    select = gets.chomp.downcase
    if %w[1 2].include?(select)
      method_constructor(attendee, select)
    elsif %w[0 3 4].include?(select)
      issue_and_revoke(select, attendee)
    else
      attendee_menu(attendee)
    end
  end

  def method_constructor(attendee, select)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    opt = OPTIONS[:attendee][select.to_i - 1]
    ApModule.attendee_message("Attendee's #{opt} #{attendee.send opt.downcase.gsub(' ', '_')}")
    attendee_back(attendee)
  end

  def issue_and_revoke(select, attendee)
    ApModule.attendee_menu_header(OPTIONS[:attendee])
    if select == '0'
      puts ''
    elsif select == '3'
      issue(attendee)
    else
      revoke(attendee)
    end
  end

  def issue(attendee)
    if attendee.pass_id.nil?
      ApModule.attendee_message("Now you have a pass ID: #{attendee.issue_pass!(rand(1..1000))}")
    else
      ApModule.attendee_message("You already have a Pass ID: #{attendee.pass_id}")
    end
    attendee_back(attendee)
  end

  def revoke(attendee)
    if attendee.pass_id.nil?
      ApModule.attendee_message("You don't have a pass!")
    else
      attendee.revoke_pass!
      ApModule.attendee_message('Yous pass was revoked!')
    end
    attendee_back(attendee)
  end

  def attendee_back(attendee)
    back = gets
    attendee_menu(attendee) if back
  end
end
