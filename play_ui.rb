class PlayUI
  def initialize(game, player)
    @game = game
    @player = player
    @x = Game::FIELD_W + 1
    @health_w = 64
  end

  def update
    check_health
  end

  def check_health
    @health_h = Game::CANVAS_H - Game::CANVAS_H * @player.health / 100
    @player.health > 25 ? @color = Color.green : @color = Color.red
  end

  def draw
    draw_health
  end

  def draw_health
    @game.draw_quad(@x, @health_h, @color, @x + @health_w, @health_h, @color, @x, Game::CANVAS_H, @color, @x + @health_w, Game::CANVAS_H, @color)
  end
end