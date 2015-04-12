class Game < Gosu::Window

  def initialize 
    super 640, 480, false
    self.caption = 'Blackmetal B* Demo'
    @background = Background.new(self)
    @player = Player.new(self)
    @controller = Controller.new(self, @player)
    @enemies = Enemies.new(self)
    @collision = CollisionEngine.new(@player, @enemies, @missiles)
    @updatables = [@background, @controller, @player, @enemies, @collision]
    @drawables = @updatables - [@controller, @collision]
  end

  def update
    Missiles.update
    @updatables.each { |u| u.update}
  end

  def draw
    Missiles.draw
    @drawables.each { |d| d.draw}
  end

  def button_down(id)
    @controller.button_down(id)
  end
end