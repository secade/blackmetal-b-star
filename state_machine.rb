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

  def new_state(state)
    case state
    when :title
      title_state
    when :play
      play_state
    end
  end

  def previous_state
    @previous_state, @current_state = @current_state, @previous_state
  end

  def title_state
    @previous_state = @current_state
    @current_state = StateTitle.new(@game)
  end

  def play_state
    @previous_state = @current_state
    @current_state = StatePlay.new(@game)
  end

  def button_down(id)
    @current_state.button_down(id)
  end
end