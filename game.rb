class Game < Gosu::Window
  attr_accessor :images

  def initialize 
    super 640, 480, false
    self.caption = 'Blackmetal B* Demo'
    @images = Images.new(self)
    @background = Background.new(self)
    @player = Player.new(self)
    @controller = Controller.new(self, @player)
    @updatables = [@background, @controller, @player]
    @drawables = @updatables - [@controller]
  end

  def update
    Bullets.update
    Enemies.update
    Explosions.update
    if rand(100) < 14 && Enemies.enemies.size < 25
      generate_enemy
    end
    @updatables.each { |u| u.update}
    CollisionEngine.check(@player)
  end

  def draw
    Bullets.draw
    Enemies.draw
    Explosions.draw
    @drawables.each { |d| d.draw}
  end

  def button_down(id)
    @controller.button_down(id)
  end

  def generate_enemy
    Enemies.create(self,rand(8..600), -32)
  end
end