TEST_ENV = true
require 'rubygems'
require 'rspec'
Dir.glob('.' + '/bowling_game.rb', &method(:require))
Dir.glob('.' + '/lib/*', &method(:require))
