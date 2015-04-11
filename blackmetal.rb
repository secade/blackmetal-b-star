# libraries
require 'gosu'
require 'find'

# game files
require_relative 'game'
require_relative 'zorder'
require_relative 'background'
require_relative 'player'
require_relative 'controller'

# initialize game
game = Game.new
game.show
