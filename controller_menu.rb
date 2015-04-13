class ControllerMenu
  def initialize(game, menu)
    @game = game
    @menu = menu
  end

  def update
  end

  def button_down(id)
    case id
    when Gosu::KbRight
      @menu.start_slide(:right)
    when Gosu::KbLeft
      @menu.start_slide(:left)
    when Gosu::KbUp
      @menu.up
    when Gosu::KbDown
      @menu.down
    when Gosu::KbReturn, Gosu::KbSpace
      start_game if @menu.display_mode == :game && !@menu.moving
    when Gosu::KbEscape
      @game.close
    end
  end

  def start_game
    @game.state_machine.new_state(:play, difficulty: Difficulty.find_by(id: @menu.cursor + 1))
  end
end