class Player
  include Collidable

  attr_accessor :x, :y, :health, :max_health

  MaxHealth = 100

  def initialize(game)
    @game = game
    @image = game.images.player.squid
    @x, @y = 304, 448
    @vx = @vy = 0
    @width, @height = @image.width * 2, @image.height * 2
    @health = MaxHealth
  end

  def update
    boundaries
    @x += @vx
    @y += @vy
    drag
    alive?
  end

  def impulse(dir)
    case dir
    when :right then @vx += 0.5
    when :left then @vx -= 0.5
    when :up then @vy -= 0.5
    when :down then @vy += 0.5
    end
  end

  def draw
    @image.draw(@x, @y, ZOrder::Player) if alive?
  end

  def collide(collidable)
    @health -= 1
    Explosions.create(@game, @x, @y, @image.width, @image.height, :contact) if collidable.is_a?(Enemy)
  end

  def alive?
    @health > 0
  end

  private

  def boundaries
    @vx = 0 if (@x <= 8 && @vx < 0) || (@x >= 600 && @vx > 0)
    @vy = 0 if (@y <= 8 && @vy < 0) || (@y >= 440 && @vy > 0)
  end

  def drag
    @vx *= 0.95
    @vy *= 0.95
  end
end
