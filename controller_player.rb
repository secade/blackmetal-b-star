class ControllerPlayer
  def initialize(game, player)
    @game = game
    @player = player
  end

  def update
    if @game.button_down? Gosu::KbLeft
      @player.impulse(:left)
    end
    if @game.button_down? Gosu::KbRight
      @player.impulse(:right)
    end
    if @game.button_down? Gosu::KbUp
      @player.impulse(:up)
    end
    if @game.button_down? Gosu::KbDown
      @player.impulse(:down)
    end
  end

  def button_down(id)
    case id 
    when Gosu::KbSpace
      Bullets.create(@game, @player.x, @player.y, :player)
    when Gosu::KbEscape
      @game.close
    end
  end
end