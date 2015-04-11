class Game < Gosu::Window
  def initialize 
    super 640, 480, false
    self.caption = 'Blackmetal B* Demo'
    @background = Background.new(self)
    @player = Player.new(self)
    @controller = Controller.new(self, @player)
  end

  def update
    @controller.update
    @player.update
  end

  def draw
    @background.draw
    @player.draw
  end

  def button_down(id)
    @controller.button_down(id)
  end
end