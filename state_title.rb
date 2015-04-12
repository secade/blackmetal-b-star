class StateTitle
  def initialize(game)
    @game = game
    @controller = ControllerMenu.new(game)
    @background = Background.new(game, false)
    # @menu = Menu.new(game)
  end

  def update

  end

  def draw
    @background.draw
    # @menu.draw
  end

  def button_down(id)
    case id
    when Gosu::KbRight
    when Gosu::KbLeft
    when Gosu::KbUp
    when Gosu::KbDown
    when Gosu::KbReturn || Gosu::KbSpace
    when Gosu::KbEscape then @game.close
    end
    puts id
  end
end