require_relative '../styles/styles'
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
end
