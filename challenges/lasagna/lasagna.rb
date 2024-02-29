# class Lasagna
class Lasagna
  def initialize
    @expected_minutes_in_oven = 40
  end

  attr_reader :expected_minutes_in_oven

  def remaining_minutes_in_oven(actual_minutes_in_oven)
    expected_minutes_in_oven - actual_minutes_in_oven
  end

  def preparation_time_in_minutes(layers)
    layers * 2
  end

  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    2 * number_of_layers + actual_minutes_in_oven
  end
end
