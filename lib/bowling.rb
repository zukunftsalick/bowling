class Bowling
  MAX_NUM_OF_FRAMES = 10
  attr_accessor :frames

  def frames=(frames)
    @frames = FrameParser.new(frames).parse
  end

  def score
    sum = 0
    return 0 unless @frames
    @frames.take(MAX_NUM_OF_FRAMES).each_with_index do |frame, index|
      if frame.strike?
        sum += calculate_strike_points(index)
      elsif frame.spare?
        sum += Frame::SPARE_POINTS + (@frames[index + 1] ? @frames[index + 1].score : 0)
      else
        sum += frame.score
      end
    end
    sum
  end

  private

  def calculate_strike_points(index)
    if @frames[index + 1].strike?
      Frame::STRIKE_POINTS + two_next_frames_points(index)
    else
      Frame::STRIKE_POINTS + next_frame_points(index)
    end
  end

  def two_next_frames_points(index)
    sum = 0
    sum += next_frame_points(index)
    sum + (@frames[index + 2] ? @frames[index + 2].score : 0)
  end

  def next_frame_points(index)
    (@frames[index + 1] ? @frames[index + 1].score : 0)
  end
end
