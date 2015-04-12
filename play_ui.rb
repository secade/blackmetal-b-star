class PlayUI
  attr_accessor :mode

  def initialize(game, player)
    @game = game
    @player = player
    @health_x = Game::FIELD_W + 1
    @health_w = 64
    @mode = :alive
    @font = @game.images.fonts.text
    @font_x = (Game::CANVAS_W - 312) / 2 # 312 is presumed length of font
    @font_y = (Game::CANVAS_H - @font.height) / 2
  end

  def update
    check_health if @mode == :alive
  end

  def check_health
    @health_h = Game::CANVAS_H - Game::CANVAS_H * @player.health / Player::MaxHealth
    @player.health > Player::MaxHealth / 4 ? @color = Color::Green : @color = Color::Red
  end

  def draw
    @mode == :alive ? draw_health : draw_death
  end

  def draw_health
    @game.draw_quad(@health_x, @health_h, @color, @health_x + @health_w, @health_h, @color, @health_x, Game::CANVAS_H, @color, @health_x + @health_w, Game::CANVAS_H, @color)
  end

  def draw_death
    @font.draw("You are dead!", @font_x, @font_y, ZOrder::Fonts, 2.0, 2.0, Color::White)
  end
end