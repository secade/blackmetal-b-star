class Bullet
  attr_accessor :x, :y, :width, :height

  def initialize(game, x, y)
    @image = Gosu::Image.load_tiles(game, "assets/img/bullet.png", 6, 13, false)
    @x, @y = x + 13, y
    @width, @height = 12, 26
    @vel = 6
  end

  def update
    @y -= @vel
  end

  def draw
    current_img = @image[Gosu::milliseconds / 100 % @image.size]
    current_img.draw(@x, @y, ZOrder::Missiles, 2, 2)
  end

  def collide
    Missiles.destroy(self)
    Explosions.create_small(x, y)
  end
end