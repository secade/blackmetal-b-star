class ControllerMenu
  def initialize(game)
    @game = game
  end

  def update
  end

  def button_down(id)
    case id
    when Gosu::KbRight
    when Gosu::KbLeft
    when Gosu::KbUp
    when Gosu::KbDown
    when Gosu::KbReturn, Gosu::KbSpace then @game.state_machine.new_state(:play, )
    when Gosu::KbEscape then @game.close
    end
  end
end