class Player
  include Collidable

  attr_accessor :x, :y

  def initialize(game)
    @image = game.images.player.squid
    @x, @y = (640 - 32) / 2, (480 - 32) / 2
    @vx = @vy = 0
    @width, @height = @image.width, @image.height
  end

  def update
    boundaries
    @x += @vx
    @y += @vy
    drag
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
    @image.draw(@x, @y, ZOrder::Player)
  end

  def collide

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