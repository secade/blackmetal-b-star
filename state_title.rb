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
    @controller.button_down(id)
  end
end