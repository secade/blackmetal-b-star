class Explosion
  def initialize(game, x, y, x_dis, y_dis)
    @image = game.images.explosions.small
    @max_time = 60
    @x, @y = x - @image.first.width / 2 + x_dis, y - @image.first.height / 2 + y_dis
    @img_interval = 15
    @time = 0
  end

  def update
    @time += 2
    Explosions.destroy(self) if @time >= @max_time
  end

  def draw
    current_img = @image[@time / @img_interval]
    current_img.draw(@x, @y, ZOrder::Explosions, 2, 2)
  end
end

class ExplosionContact < Explosion
  def initialize(game, x, y, x_dis, y_dis)
    super
    @image = game.images.explosions.contact
    @max_time = 20
    @img_interval = 10
  end

  def draw
    current_img = @image[@time / @img_interval]
    current_img.draw(@x, @y, ZOrder::Explosions, 2, 2)
  end
end