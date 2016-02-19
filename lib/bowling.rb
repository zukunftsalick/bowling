class Bowling
  MAX_NUM_OF_FRAMES = MAX_POINTS_PER_FRAME = SPARE_POINTS = STRIKE_POINTS = 10
  attr_accessor :rolls

  def initialize
    @current_roll_index = 0
    @rolls = []
  end

  def score
    sum = 0
    number_of_rolls.times do
      if strike?
        sum += STRIKE_POINTS + next_two_rolls_points
        @current_roll_index += 1
      elsif spare?
        sum += SPARE_POINTS + next_roll_points
        @current_roll_index += 2
      else
        sum += knocked_down_pins_points
        @current_roll_index += 2
      end
    end
    sum
  end

private
  def knocked_down_pins_points
    @rolls[@current_roll_index].to_i + @rolls[@current_roll_index + 1].to_i
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
    knocked_down_pins_points == SPARE_POINTS
  end

  def number_of_rolls
    @rolls.take(MAX_NUM_OF_FRAMES).size
  end

end
