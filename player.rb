class Player
  def initialize(game)
    @image = Gosu::Image.new(game, "assets/img/squid.png", false)
    @x, @y = (640 - 32) / 2, (480 - 32) / 2
    @vx = @vy = 0
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