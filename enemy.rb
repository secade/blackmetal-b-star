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
    @vel = rand * (2.0) + 2.0 * StatePlay.difficulty.speed
    @x, @y = x, y
    @vx = @vy = @vel
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
    if rand(1000) < 5 * StatePlay.difficulty.fire_rate
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

  def off_screen?
    @x + @width < 0 || @x > Game::FIELD_W || @y + @height < 0 || @y > Game::FIELD_W
  end

  private

  def calc_ybound
    @ybound = rand(100..200) + @ticker
  end

  def calc_xbound
    @xbound = rand(100..320)
  end

  def shoot_missile
    Bullets.create({game: @game, x: @x, y: @y, vels: {x: 0, y: 6 * StatePlay.difficulty.fire_speed}, type: :e_bullet})
  end
end

class Turret
  include Collidable
  attr_accessor :x, :y, :width, :height, :value
  MaxHp = 10

  def initialize(game, x, y)
    @image = game.images.enemies.turret
    @game = game
    @hp = MaxHp
    calc_anim
    @orb_timer = rand(40..100) / StatePlay.difficulty.fire_rate
    @ticker = @orb_timer
    @color = Color.create
    @width = @height = 32
    @vy = 4 * StatePlay.difficulty.speed
    @x, @y = x, y
    @value = 10
  end

  def update
    calc_anim
    @y += @vy

    if tick
      shoot_orb
    end
  end

  def calc_anim
    if @hp > MaxHp / 2 
      @anim = @image[0..1]
    elsif @hp > MaxHp / 4
      @anim = @image[2..3]
    else
      @anim = @image[4..5]
    end 
  end

  def draw
    current_img = @anim[Gosu::milliseconds / 200 % @anim.size]
    current_img.draw(@x, @y, ZOrder::Enemies, 2, 2)
  end

  def collide(collidable)
    if @hp > 0
      @hp += -1
    else
      Enemies.destroy(self)
    end
  end

  def tick
    @ticker -= 1
    @ticker <= 0
  end

  def shoot_orb
    @ticker = @orb_timer
    Bullets.create({game: @game, x: @x + 4, y: @y + 4, vels: calc_orb_vels, type: :e_orb})
  end

  def calc_orb_vels
    a = Player.calc_angle_from_p(@x, @y)
    Tracker.calc_vectors(6 * StatePlay.difficulty.fire_speed, a)
  end

  def off_screen?
    @x + @width < 0 || @x > Game::FIELD_W || @y + @height < 0 || @y > Game::FIELD_W
  end
end
