class Game < Gosu::Window
  attr_accessor :missiles

  def initialize 
    super 640, 480, false
    self.caption = 'Blackmetal B* Demo'
    @background = Background.new(self)
    @player = Player.new(self)
    @controller = Controller.new(self, @player)
    @missiles = Missiles.new(self)
    @enemies = Enemies.new(self)
    @updatables = [@background, @controller, @player, @missiles, @enemies]
    @drawables = @updatables - [@controller]
  end

  def update
    @updatables.each { |u| u.update}
  end

  def draw
    @drawables.each { |d| d.draw}
  end

  def button_down(id)
    @controller.button_down(id)
  end
end