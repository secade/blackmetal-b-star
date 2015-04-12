class ControllerPlayer
  attr_accessor :mode

  def initialize(game, player)
    @game = game
    @player = player
    @mode = :alive
  end

  def update
    if @mode == :alive
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
  end

  def button_down(id)
    case id 
    when Gosu::KbSpace
      @mode == :alive ? fire_bullet : end_game
    when Gosu::KbEscape
      end_game
    end
  end

  def fire_bullet
    Bullets.create(@game, @player.x, @player.y, :player)
  end

  def end_game
    @game.state_machine.new_state(:title)
  end
end