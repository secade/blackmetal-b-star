class Controller
  def initialize(game, player)
    @game = game
    @player = player
  end

  def update
    if @game.button_down? Gosu::KbLeft
      @player.move_left
    end
    if @game.button_down? Gosu::KbRight
      @player.move_right
    end
    if @game.button_down? Gosu::KbUp
      @player.move_up
    end
    if @game.button_down? Gosu::KbDown
      @player.move_down
    end
  end

  def button_down(id)
    if id == Gosu::KbEscape
      @game.close
    end
  end
end