class Explosion
  def initialize(game, x, y)
    @image = Gosu::Image.load_tiles(game, "assets/img/explosion.png", 16, 16, false)
    @x, @y = x, y
    @time = 0
  end

  def update
    @time += 2
    Explosions.destroy(self) if @time >= 60
  end

  def draw
    current_img = @image[@time / 8]
    current_img.draw(@x, @y, ZOrder::Explosions, 2, 2)
  end
end