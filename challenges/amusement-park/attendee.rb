class Attendee
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
  end  
end
