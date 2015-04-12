class Images
  attr_reader :fonts, :maps, :player, :enemies, :bullets, :explosions

  def initialize(game)
    @fonts = Images::Fonts.new(game)
    @maps = Images::Maps.new(game)
    @player = Images::Player.new(game)
    @enemies = Images::Enemies.new(game)
    @bullets = Images::Bullets.new(game)
    @explosions = Images::Explosions.new(game)
  end

  class Fonts
    attr_reader :text

    def initialize(game)
      @text = Gosu::Font.new(game, "Courier", 24)
    end
  end

  class Maps
    attr_reader :space_img, :space_tiles

    def initialize(game)
      @space_img = Gosu::Image.new(game, "assets/img/space.jpg", false)
      @space_tiles = Gosu::Image::load_tiles(game, "assets/img/space.jpg", 320, 1080, false)
    end
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
