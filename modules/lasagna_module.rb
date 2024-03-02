# module LasagnaModule
module LasagnaModule
  def self.lasagna_menu_header(options)
    Styles.clear
    Styles.htitle('Lasagna')
    Styles.title('Options')
    Styles.line
    Styles.options(options)
    Styles.ltext('0 -> Main menu')
    Styles.footer
  end

  def self.message(text, options)
    lasagna_menu_header(options)
    Styles.htitle(text)
  end
end
