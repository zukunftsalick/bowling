Dir.glob('.' + '/lib/*', &method(:require))

class BowlingGame
  attr_reader :score
  def initialize(args)
    if args.empty?
      puts 'A comma-separated line of numbers representing the number of pins knocked down per bowl is required'
      puts 'e.g: ruby bowling_game.rb 1,2,3,4'
      abort
    else
      bowling = Bowling.new
      bowling.frames = args.reduce(&:+).split(',').map(&:to_i)
      @score = bowling.score
    end
  end
end

puts BowlingGame.new(ARGV).score unless defined? TEST_ENV
