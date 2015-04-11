class Game < Gosu::Window
  def initialize 
    super 640, 480, false
    self.caption = 'Blackmetal B* Demo'
    @background = Background.new(self)
    @player = Player.new(self)
    @controller = Controller.new(self, @player)
    @updatables = [@background, @controller, @player]
  end

  def update
    @updatables.each { |u| u.update}
  end

  def draw
    @background.draw
    @player.draw
  end

  def button_down(id)
    @controller.button_down(id)
  end
end