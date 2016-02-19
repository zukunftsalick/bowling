class Bowling
  attr_accessor :rolls

  def score
    sum = 0
    current_roll = 0

    10.times do
      if strike?(current_roll)
        sum += 10 + @rolls[current_roll + 1].to_i + @rolls[current_roll + 2].to_i
        current_roll += 1
      elsif @rolls[current_roll].to_i + @rolls[current_roll + 1].to_i == 10
        sum += 10 + @rolls[current_roll + 2].to_i
        current_roll += 2
      else
        sum += @rolls[current_roll].to_i + @rolls[current_roll + 1].to_i
        current_roll += 2
      end
    end
    sum
  end

private
  def strike?(current_roll)
    @rolls[current_roll] == 10
  end

end
