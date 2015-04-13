class StateTitle
  def initialize(game)
    @game = game
    @background = Background.new(game, false)
    @menu = Menu.new(game)
    @controller = ControllerMenu.new(game, @menu)
  end

  def update
    @controller.update
    @menu.update
  end

  def draw
    @background.draw
    @menu.draw
  end

  def button_down(id)
    @controller.button_down(id)
  end
end