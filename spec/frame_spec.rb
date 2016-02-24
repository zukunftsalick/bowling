require 'spec_helper'

describe Frame do
  describe 'when initializing' do
    it 'sets strike state' do
      expect(Frame.new(10).strike?).to be true
    end

    it 'sets spare state' do
      expect(Frame.new([5, 5]).spare?).to be true
    end

    it 'sets open state' do
      expect(Frame.new([3, 3]).open?).to be true
    end

    it 'sets frame size' do
      expect(Frame.new(10).size).to eql 1
    end
  end

  describe '#score' do
    it 'returns 10 for a strike' do
      expect(Frame.new(10).score).to eql 10
    end

    it 'returns 10 for a spare' do
      expect(Frame.new([5, 5]).score).to eql 10
    end

    it 'returns 6 for an open' do
      expect(Frame.new([3, 3]).score).to eql 6
    end
  end
end
