class Bowling
  NUM_OF_FRAMES = 10
  MAX_FRAME_POINTS = 10
  attr_accessor :rolls

  def initialize
    @current_roll_index = 0
  end

  def score
    sum = 0

    number_of_rolls.times do
      if strike?
        sum += MAX_FRAME_POINTS + @rolls[@current_roll_index + 1].to_i + @rolls[@current_roll_index + 2].to_i
        @current_roll_index += 1
      elsif spare?
        sum += MAX_FRAME_POINTS + @rolls[@current_roll_index + 2].to_i
        @current_roll_index += 2
      else
        sum += @rolls[@current_roll_index].to_i + @rolls[@current_roll_index + 1].to_i
        @current_roll_index += 2
      end
    end
    sum
  end

private
  def strike?
    @rolls[@current_roll_index] == MAX_FRAME_POINTS
  end

  def spare?
    @rolls[@current_roll_index].to_i + @rolls[@current_roll_index + 1].to_i == MAX_FRAME_POINTS
  end

  def number_of_rolls
    @rolls.take(NUM_OF_FRAMES).size
  end

end
