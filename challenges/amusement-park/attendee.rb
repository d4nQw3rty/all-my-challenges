# class Attendee
class Attendee
  attr_reader :attendee_heigth, :pass_id

  def height
    @attendee_height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = false
  end

  private

  def initialize(height)
    @attendee_height = height
  end
end
