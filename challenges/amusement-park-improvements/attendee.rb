# class Attendee
class Attendee
  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = false
  end

  def has_pass?
    if @pass_id
      true
    else
      false
    end
  end

  def fits_ride?(ride_minimum_height)
    @attendee_height >= ride_minimum_height
  end

  def allowed_to_ride?(ride_minimum_height)
    has_pass? && fits_ride?(ride_minimum_height)
  end

  private

  def initialize(height)
    @attendee_height = height
  end
end
