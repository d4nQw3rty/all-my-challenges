# module AmusementParkModule
module ApModule
  def self.amp_header(options)
    Styles.clear
    Styles.htitle('Amusement Park')
    Styles.title('Options')
    Styles.line
    Styles.options(options)
    Styles.ltext('0 -> Manin menu')
    Styles.footer
  end

  def self.attendee_menu_header(options)
    Styles.clear
    Styles.htitle('Amusement Park')
    Styles.title('Options')
    Styles.line
    Styles.options(options)
    Styles.ltext('0 -> Amusement Park Menu')
    Styles.footer
  end

  def self.attendee_message(message)
    Styles.line
    Styles.ltext(message)
    Styles.footer
  end

  def self.pass_id_report(attendee, options)
    attendee_menu_header(options)
    if attendee.pass_id
      attendee_message("Attendee's Pass ID: #{attendee.pass_id}")
    else
      attendee_message("You don't have Pass")
    end
  end

  def self.fit_ride(attendee, options)
    attendee_menu_header(options)
    Styles.htitle('Enter minimum height for the ride')
    minimum_height = gets.chomp.to_i
    attendee_menu_header(options)
    if attendee.fits_ride?(minimum_height)
      attendee_message('You fit the minimum height')
    else
      attendee_message("You don't fit the minimum height")
    end
  end
end
