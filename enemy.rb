class Enemy
  attr_accessor :x, :y, :width, :height

  def initialize(game, x, y)
    @image = Gosu::Image.load_tiles(game, "assets/img/ruby_down.png", 16, 16, false)
    @ticker = 0
    calc_color
    calc_ybound
    calc_xbound
    @vel = rand * (2.0) + 2.0
    @x, @y = x, y
    @vx, @vy = 4, 4
    @width = @height = 32
  end

  def update
    if rand(100) < 4
      @ticker += 10
    end
    impulse
    @x += @vx
    @y += @vy
  end

  def impulse
    if @x <= 320 - @xbound
      @vx = @vel
      calc_xbound
    elsif @x >= 288 + @xbound 
      @vx = -@vel
      calc_xbound
    end
    if @y <= 8
      @vy = @vel
    elsif @y >= @ybound
      @vy = -@vel
      calc_ybound
    end
  end

  def draw
    current_img = @image[Gosu::milliseconds / 200 % @image.size]
    current_img.draw(@x, @y, ZOrder::Enemies, 2, 2, @color)
  end

  def collide?(collidable)
    (@x - collidable.x).abs <= @width && (@y - collidable.y).abs <= @height
  end

  def collide
    Enemies.destroy(self)
  end

  private

  def calc_ybound
    @ybound = rand(100..200) + @ticker
  end

  def calc_xbound
    @xbound = rand(100..320)
  end

  def calc_color
    @color = Gosu::Color.new(0xff000000)
    @color.red = rand(256 - 40) + 40
    @color.green = rand(256 - 40) + 40
    @color.blue = rand(256 - 40) + 40
  end
end