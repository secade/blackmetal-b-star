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
    when Gosu::KbU
      binding.pry
    when Gosu::KbEscape
      end_game
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
    [[6,0], [-6, 0], [0, 6], [0, -6], [6, 6], [6, -6], [-6, 6], [-6, -6]].each do |vels|
      Bullets.create({game: @game, x: @player.x, y: @player.y, vels: {x: vels[0], y: vels[1]}, type: :p_star, first_gen: true })
    end
  end

  def end_game
    StatePlay.clean_game
    @game.state_machine.new_state(:title)
  end
end
