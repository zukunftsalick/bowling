class Bowling
  NUM_OF_FRAMES = 10
  attr_accessor :rolls

  def initialize
    @current_roll_index = 0
  end

  def score
    sum = 0

    game_rolls.each do
      if strike?
        sum += 10 + @rolls[@current_roll_index + 1].to_i + @rolls[@current_roll_index + 2].to_i
        @current_roll_index += 1
      elsif @rolls[@current_roll_index].to_i + @rolls[@current_roll_index + 1].to_i == 10
        sum += 10 + @rolls[@current_roll_index + 2].to_i
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
    @rolls[@current_roll_index] == 10
  end

  def game_rolls
    @rolls.take(NUM_OF_FRAMES)
  end

end
