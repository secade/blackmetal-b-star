# libraries
require 'gosu'
require 'find'
require 'pry'
# game files
require_relative 'game'
require_relative 'images'
require_relative 'zorder'
require_relative 'background'
require_relative 'collidable'
require_relative 'player'
require_relative 'controller'
require_relative 'collision_engine'
require_relative 'explosions'
require_relative 'explosion'
require_relative 'missiles'
require_relative 'bullet'
require_relative 'enemies'
require_relative 'enemy'

# initialize game
game = Game.new
# $images = Images.new(game)
game.show
