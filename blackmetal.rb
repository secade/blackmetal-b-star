# libraries
require 'gosu'
require 'find'
require 'pry'

# game files
require_relative 'game'
require_relative 'color'
require_relative 'images'
require_relative 'zorder'
require_relative 'state_machine'
require_relative 'state_title'
require_relative 'background'
require_relative 'menu'
require_relative 'controller_menu'
require_relative 'state_play'
require_relative 'collidable'
require_relative 'player'
require_relative 'play_ui'
require_relative 'controller_player'
require_relative 'collision_engine'
require_relative 'explosions'
require_relative 'explosion'
require_relative 'bullets'
require_relative 'bullet'
require_relative 'enemies'
require_relative 'enemy'

# initialize game
game = Game.new

# binding.pry
game.show
