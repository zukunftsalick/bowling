require 'spec_helper'

describe Bowling do
  subject { Bowling.new }
  describe '#score' do
    it 'returns 0 for no frames' do
      expect(subject.score).to eql 0
    end

    it 'returns 0 for no pins' do
      subject.frames = [0, 0, 0, 0]
      expect(subject.score).to eql 0
    end

    it 'returns 5 for five bowns with 1 pin each' do
      subject.frames = [1, 1, 1, 1, 1]
      expect(subject.score).to eql 5
    end

    it 'returns 22 with one spare' do
      subject.frames = [5, 5, 6, 0]
      expect(subject.score).to eql 22
    end

    it 'returns 22 with one strike and incomplete set of frames' do
      subject.frames = [10, 5, 1]
      expect(subject.score).to eql 22
    end

    it 'returns 300 for a perfect game of strikes' do
      subject.frames = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
      expect(subject.score).to eql 300
    end

    it 'returns 48 with one spare and one strike' do
      subject.frames = [9, 1, 10, 8, 0, 2]
      expect(subject.score).to eql 48
    end

    it 'returns 20 with one spare' do
      subject.frames = [1, 2, 3, 4, 5, 5]
      expect(subject.score).to eql 20
    end

    it 'returns 50 with a mix of spares and one strike' do
      subject.frames = [10, 0, 0, 9, 1, 0, 0, 8, 2, 0, 0, 7, 3, 0, 0, 6, 4, 0, 0]
      expect(subject.score).to eql 50
    end
  end
end
