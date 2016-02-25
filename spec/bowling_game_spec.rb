require 'spec_helper'

describe BowlingGame do
  before do
    allow_any_instance_of(BowlingGame).to receive(:puts)
  end

  describe '.initialize' do
    it 'should accept a comma-separated line of numbers' do
      argv = ['1,2,3,4']
      expect { BowlingGame.new(argv) }.not_to raise_error
    end

    it 'should not accept an empty argument' do
      argv = ''
      expect { BowlingGame.new(argv) }.to raise_error SystemExit
    end
  end
end
