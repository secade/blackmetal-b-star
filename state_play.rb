class StatePlay < StateMachine
  def initialize(game)
    @game = game
    @background = Background.new(@game)
    @player = Player.new(@game)
    @controller = ControllerPlayer.new(@game, @player)
    @ui = PlayUI.new(@game, @player)
    @updatables = [@background, @controller, @player, @ui]
    @drawables = @updatables - [@controller]
  end

  def update
    Bullets.update
    Enemies.update
    Explosions.update
    if rand(100) < 14 && Enemies.enemies.size < 25
      generate_enemy
    end
    @updatables.each { |u| u.update }
    CollisionEngine.check(@player)
  end

  def draw
    Bullets.draw
    Enemies.draw
    Explosions.draw
    @drawables.each { |d| d.draw }
  end

  def button_down(id)
    @controller.button_down(id)
  end

  def generate_enemy
    Enemies.create(@game,rand(8..600), -32)
  end
end
