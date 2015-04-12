class Bullet
  include Collidable
  attr_accessor :type, :x, :y, :width, :height

  def initialize(hash)
    @game = hash[:game]
    @image = @game.images.bullets.small
    @type = hash[:type] || :enemy
    @x, @y = hash[:x], hash[:y]
    @width, @height = @image.first.width * 2, @image.first.height * 2
    @vx, @vy = hash[:vels][:x], hash[:vels][:y]
  end

  def update
    @x += @vx
    @y += @vy
  end

  def draw
    current_img = @image[Gosu::milliseconds / 100 % @image.size]
    current_img.draw(@x, @y, ZOrder::Missiles, 2, 2)
  end

  def collide(collidable)
    Bullets.destroy(self)
    Explosions.create(@game, @x, @y, @image.first.width, @type == :enemy ? @image.first.height : 0)
  end
end

class EnemyBullet < Bullet
  def initialize(hash)
    super
    @image = @game.images.bullets.enemy_small
    @color = Color.create
  end
end

class LightOrb < Bullet
  def initialize(hash)
    super
    @image = @game.images.bullets.light_orb
  end
end