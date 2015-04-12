class Explosion
  def initialize(game, x, y)
    @image = game.images.explosions.small
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
