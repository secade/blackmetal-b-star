# libraries
require 'gosu'

# game files
Dir[File.join(".", "**/*.rb")].each do |f|
  require f
end

# initialize game
game = Game.new
game.show