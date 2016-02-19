class Bowling
  MAX_NUM_OF_FRAMES = MAX_POINTS_PER_FRAME = SPARE_POINTS = STRIKE_POINTS = 10
  attr_accessor :rolls

  def initialize
    @current_roll_index = 0
    @rolls = []
  end

  def score
    number_of_rolls.times.inject(0) do |sum|
      if strike?
        sum += calculate_strike_points
      elsif spare?
        sum += calculate_spare_points
      else
        sum += knocked_down_pins_points
      end
    end
  end

  private

  def calculate_spare_points
    points = SPARE_POINTS + next_roll_points
    @current_roll_index += 2
    points
  end

  def calculate_strike_points
    points = STRIKE_POINTS + next_two_rolls_points
    @current_roll_index += 1
    points
  end

  def knocked_down_pins_points(change_index: true)
    points = @rolls[@current_roll_index].to_i + @rolls[@current_roll_index + 1].to_i
    @current_roll_index += 2 if change_index
    points
  end

  def next_two_rolls_points
    @rolls[@current_roll_index + 1].to_i + @rolls[@current_roll_index + 2].to_i
  end

  def next_roll_points
    @rolls[@current_roll_index + 2].to_i
  end

  def strike?
    @rolls[@current_roll_index] == STRIKE_POINTS
  end

  def spare?
    knocked_down_pins_points(change_index: false) == SPARE_POINTS
  end

  def number_of_rolls
    @rolls.take(MAX_NUM_OF_FRAMES).size
  end
end
