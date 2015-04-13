class ControllerPlayer
  attr_accessor :mode

  def initialize(game, player)
    @game = game
    @player = player
    @mode = :alive
  end

  def update
    if @mode == :alive
      @player.impulse(:left) if @game.button_down? Gosu::KbLeft
      @player.impulse(:right) if @game.button_down? Gosu::KbRight
      @player.impulse(:up) if @game.button_down? Gosu::KbUp
      @player.impulse(:down) if @game.button_down? Gosu::KbDown
    end
  end

  def button_down(id)
    case id 
    when Gosu::KbSpace
      @mode == :alive ? fire_bullet : end_game
    when Gosu::KbLeftControl
      fire_orbs if @mode == :alive 
    when Gosu::KbZ
      fire_stars if @mode == :alive && @player.star_ready?
    when Gosu::KbEscape
      end_game(true)
    end
  end

  def fire_bullet
    Bullets.create({game: @game, x: @player.x + 13, y: @player.y, vels: {x: 0, y: -6}, type: :p_bullet})
  end

  def fire_orbs
    Bullets.create({game: @game, x: @player.x, y: @player.y, vels: {x: -3, y: -6}, type: :p_light_orb})
    Bullets.create({game: @game, x: @player.x, y: @player.y, vels: {x: 3, y: -6}, type: :p_light_orb})
  end

  def fire_stars
    @player.start_star_timer
    [0, 45, 90, 135, 180, 225, 270, 315].each do |angle|
      Bullets.create({game: @game, x: @player.x, y: @player.y, vels: Tracker.calc_vectors(6, angle), type: :p_star, first_gen: true })
    end
  end

  def end_game(killed = false)
    Score.create(difficulty: StatePlay.difficulty, score: Player.score) unless killed
    StatePlay.clean_game
    @game.state_machine.new_state(:title)
  end
end
