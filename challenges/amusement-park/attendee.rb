class Attendee
  attr_reader :attendee_heigth, :pass_id
  def height
    @attendee_height
  end

  def pass_id
    @pass_id
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  private
  def initialize(height)
    @attendee_height = height
    @pass_id = nil 
  end  
end
