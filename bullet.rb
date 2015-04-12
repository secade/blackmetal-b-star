class Bullet
  include Collidable
  attr_accessor :type, :x, :y, :width, :height

  def initialize(game, x, y)
    @game = game
    @image = game.images.bullets.small
    @type = :player
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

  def collide(collidable)
    Bullets.destroy(self)
    Explosions.create(@game, @x, @y, @image.first.width, @type == :enemy ? @image.first.height : 0)
  end
end

class EnemyBullet < Bullet
  def initialize(game, x, y)
    super
    @image = game.images.bullets.enemy_small
    @type = :enemy
    @color = Color.create
    @vel = -6
  end
end
