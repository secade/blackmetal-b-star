class StateMachine
  def initialize(game)
    @game = game
    @current_state = StateTitle.new(game)
    @previous_state
  end

  def update
    @current_state.update
  end

  def draw
    @current_state.draw
  end

  def new_state(state, options = {difficulty: Difficulty::Standard})
    case state
    when :title
      title_state(options)
    when :play
      play_state(options)
    end
  end

  def swap_state
    @previous_state, @current_state = @current_state, @previous_state
  end

  def title_state(options)
    @previous_state = @current_state
    @current_state = StateTitle.new(@game)
  end

  def play_state(options)
    @previous_state = @current_state
    @current_state = StatePlay.new(@game, options[:difficulty])
  end

  def button_down(id)
    @current_state.button_down(id)
  end
end