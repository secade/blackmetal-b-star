class Player
  def initialize(game)
    @image = Gosu::Image.new(game, "assets/img/squid.png", false)
    @x = @y = @vx = @vy = 0
  end

  def update
    @x += @vx
    @x %= 640
    @y += @vy
    @y %= 480
    drag
  end

  def move_right
    @vx += 0.5
  end

  def move_left
    @vx -= 0.5
  end

  def move_up
    @vy -= 0.5
  end

  def move_down
    @vy += 0.5
  end

  def draw
    @image.draw(@x, @y, ZOrder::Player)
  end

  private

  def drag
    @vx *= 0.95
    @vy *= 0.95
  end
end