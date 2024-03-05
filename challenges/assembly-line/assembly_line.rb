# class AssemblyLine
class AssemblyLine
  RATE = { 100 => 1, 90 => 0.9, 80 => 0.8, 77 => 0.77 }

  private

  def initialize(speed)
    @speed = speed
    @brute_production = @speed * 221
  end

  public

  attr_reader :speed, :brute_production

  def production_rate_per_hour
    if speed.between?(1, 8)
      low_mid_speed
    elsif speed <= 10
      high_speed
    else
      'Error: Speed must be 1 to 10 range'
    end
  end

  def low_mid_speed
    if speed.between?(1, 4)
      brute_production
    else
      brute_production * RATE[90]
    end
  end

  def high_speed
    if speed < 10
      brute_production * RATE[80]
    else
      brute_production * RATE[77]
    end
  end

  def working_items_per_minute
    cars_per_minute = production_rate_per_hour / 60
    cars_per_minute.to_i
  end
end
