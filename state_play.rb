class StatePlay < StateMachine
  def initialize(game)
    @game = game
    @background = Background.new(@game)
    @player = Player.new(@game)
    @controller = ControllerPlayer.new(@game, @player)
    @ui = PlayUI.new(@game, @player)
    @updatables = [@background, @controller, @ui]
    @drawables = @updatables - [@controller]
    @mode = :alive
  end

  def update
    if @player.update && @mode == :alive
      Bullets.update
      Enemies.update
      Explosions.update
      generate_enemy
      generate_turret
      @updatables.each { |u| u.update }
      CollisionEngine.check(@player)
    else 
      player_death
    end
  end

  def draw
    Bullets.draw
    Enemies.draw
    Explosions.draw
    @player.draw if @mode == :alive
    @drawables.each { |d| d.draw }
  end

  def button_down(id)
    @controller.button_down(id)
  end

  def generate_enemy
    if rand(100) < 14 && Enemies.enemies.size < 25
      Enemies.create(@game,rand(8..600), -32, :small)
    end
  end

  def generate_turret
    if rand(100) < 4
      Enemies.create(@game,rand(8..600), -32, :turret)
    end
  end

  def player_death
    @ui.mode = :dead
    @controller.mode = :dead
  end
end
