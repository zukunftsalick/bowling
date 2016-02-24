class Frame
  MAX_POINTS_PER_FRAME = SPARE_POINTS = STRIKE_POINTS = 10

  def initialize(frame)
    @frame = Array(frame)
    if @frame[0].to_i == MAX_POINTS_PER_FRAME
      @state = :strike
    elsif @frame[0].to_i + @frame[1].to_i == MAX_POINTS_PER_FRAME
      @state = :spare
    else
      @state = :open
    end
  end

  def score
    if strike?
      STRIKE_POINTS
    elsif spare?
      SPARE_POINTS
    else
      @frame[0].to_i + @frame[1].to_i
    end
  end

  def strike?
    @state == :strike
  end

  def spare?
    @state == :spare
  end

  def open?
    @state == :open
  end

  def size
    @frame.size
  end
end
