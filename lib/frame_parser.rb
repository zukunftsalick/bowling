class FrameParser
  def initialize(frames = [])
    @frames = frames
  end

  def parse
    @frames.each_with_index.map do |frame, index|
      if frame == Frame::STRIKE_POINTS
        Frame.new([frame])
      else
        @frames.shift
        Frame.new([frame, @frames[index].to_i])
      end
    end
  end
end
