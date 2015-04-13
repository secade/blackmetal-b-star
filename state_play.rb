class StatePlay < StateMachine
  @@difficulty = []

  def self.clean_game
    Bullets.destroy_all
    Enemies.destroy_all
    Explosions.destroy_all
    @@difficulty.clear
  end

  def self.difficulty
    @@difficulty.first
  end

  def initialize(game, difficulty)
    @game = game
    @@difficulty << difficulty
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
    if rand(100) < 10 * StatePlay.difficulty.gen && Enemies.small_count < 25 * StatePlay.difficulty.max
      Enemies.create(@game,rand(8..600), -32, :small)
    end
  end

  def generate_turret
    if rand(100) < 2 * StatePlay.difficulty.gen
      [[32, Game::FIELD_W - 64], [64, Game::FIELD_W - 96]].sample.each do |x|
        Enemies.create(@game, x, -32, :turret)
      end
    end
  end

  def player_death
    @ui.mode = :dead
    @controller.mode = :dead
    
  end
end
