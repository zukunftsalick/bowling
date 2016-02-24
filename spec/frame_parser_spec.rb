require 'spec_helper'

describe FrameParser do
  describe '#parser' do
    it 'creates 3 frames for 3 strikes' do
      frames = FrameParser.new([10, 10, 10]).parse
      expect(frames.size).to eql 3
    end

    it 'creates 3 frames for 6 open plays' do
      frames = FrameParser.new([3, 3, 3, 3, 3, 3]).parse
      expect(frames.size).to eql 3
    end

    it 'creates 3 frames for 1 spare and 2 open plays' do
      frames = FrameParser.new([5, 5, 3, 3, 3, 3]).parse
      expect(frames.size).to eql 3
    end
  end
end
