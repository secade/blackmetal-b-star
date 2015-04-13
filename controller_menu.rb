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
      @menu.slide(:right)
    when Gosu::KbLeft
      @menu.slide(:left)
    when Gosu::KbUp
      @menu.up
    when Gosu::KbDown
      @menu.down
    when Gosu::KbReturn, Gosu::KbSpace
      @game.state_machine.new_state(:play, difficulty: Difficulty.set(@menu.cursor))
    when Gosu::KbEscape
      @game.close
    end
  end
end