class PlayUI
  attr_accessor :mode

  def initialize(game, player)
    @game = game
    @player = player
    @health_x, @health_w = Game::FIELD_W + 1, 64
    @mode = :alive
    @font = @game.images.fonts.text
    @font_x, @font_y = (Game::CANVAS_W - 312) / 2, (Game::CANVAS_H - @font.height) / 2
    @star_x, @star_w = Game::FIELD_W + 65, 64
    @score_x, @score_y = 16, (Game::CANVAS_H - @font.height) - 16
  end

  def update
    check_health if @mode == :alive
    check_star
  end

  def check_health
    @health_h = Game::CANVAS_H - Game::CANVAS_H * @player.health / Player::MaxHealth
    @player.health > Player::MaxHealth / 4 ? @color = Color::Green : @color = Color::Red
  end

  def check_star
    @star_h = Game::CANVAS_H - Game::CANVAS_H * @player.star_timer / Player::StarTimer
  end

  def draw
    if @mode == :alive
      draw_health
      draw_star_timer
    else
      draw_death
    end
    draw_score
  end

  def draw_health
    @game.draw_quad(@health_x, @health_h, @color, @health_x + @health_w, @health_h, @color, @health_x, Game::CANVAS_H, @color, @health_x + @health_w, Game::CANVAS_H, @color)
  end

  def draw_death
    @font.draw("You are dead!", @font_x, @font_y, ZOrder::Fonts, 2.0, 2.0, Color::White)
  end

  def draw_star_timer
    @game.draw_quad(@star_x, Game::CANVAS_H - @star_h, Color::Blue, @star_x + @star_w, Game::CANVAS_H - @star_h, Color::Blue, @star_x, Game::CANVAS_H, Color::Blue, @star_x + @star_w, Game::CANVAS_H, Color::Blue)
  end

  def draw_score
    @font.draw("#{Player.score}", @score_x, @score_y, ZOrder::Fonts, 2.0, 2.0, Color::White)
  end
end