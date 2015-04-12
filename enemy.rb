class Enemy
  include Collidable
  attr_accessor :x, :y, :width, :height, :value

  def initialize(game, x, y)
    @image = game.images.enemies.ruby
    @game = game
    @ticker = 0
    @color = Color.create
    calc_ybound
    calc_xbound
    @vel = rand * (2.0) + 2.0
    @x, @y = x, y
    @vx, @vy = 4, 4
    @width = @height = 32
    @value = 1
  end

  def update
    if rand(100) < 5
      @ticker += 10
    end
    impulse
    @x += @vx
    @y += @vy
    if rand(1000) < 5
      shoot_missile
    end
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

  def collide(collidable)
    Enemies.destroy(self)
  end

  private

  def calc_ybound
    @ybound = rand(100..200) + @ticker
  end

  def calc_xbound
    @xbound = rand(100..320)
  end

  def shoot_missile
    Bullets.create({game: @game, x: @x, y: @y, vels: {x: 0, y: 6}, type: :e_bullet})
  end
end
