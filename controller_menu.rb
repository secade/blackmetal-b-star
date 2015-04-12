class ControllerMenu
  def initialize(game)
    @game = game
  end

  def update
  end

  def button_down(id)
    case id 
    when Gosu::KbSpace
      # Bullets.create(@game, @player.x, @player.y, :player)
    when Gosu::KbEscape
      # @game.close
    end
  end
end