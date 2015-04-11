class Bullet
  attr_accessor :x, :y
  def initialize(game, x, y)
    @image = Gosu::Image.new(game, "assets/img/bullet.png", false)
    @x, @y = x + (32 - @image.width) / 2, y
    @vel = 6
  end

  def update
    @y -= @vel
  end

  def draw
    @image.draw(@x, @y, ZOrder::Missiles, 2, 2)
  end

  def width
    @image.width
  end

  def height
    @image.height
  end
end