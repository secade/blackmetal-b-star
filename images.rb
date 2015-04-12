class Images
  attr_reader :player, :enemies, :bullets, :explosions

  def initialize(game)
    @player = Images::Player.new(game)
    @enemies = Images::Enemies.new(game)
    @bullets = Images::Bullets.new(game)
    @explosions = Images::Explosions.new(game)
  end

  class Player
    attr_reader :squid

    def initialize(game)
      @squid = Gosu::Image.new(game, "assets/img/squid.png", false)
    end
  end

  class Enemies
    attr_reader :ruby

    def initialize(game)
      @ruby = Gosu::Image.load_tiles(game, "assets/img/ruby_down.png", 16, 16, false)
    end
  end

  class Bullets
    attr_reader :small, :enemy_small

    def initialize(game)
      @small = Gosu::Image.load_tiles(game, "assets/img/bullet.png", 6, 13, false)
      @enemy_small = Gosu::Image.load_tiles(game, "assets/img/enemy_bullet.png", 6, 13, false)
    end
  end

  class Explosions
    attr_reader :small

    def initialize(game)
      @small = Gosu::Image.load_tiles(game, "assets/img/explosion.png", 16, 16, false)
    end
  end
end
