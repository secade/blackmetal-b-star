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

  def title_state

  end

  def play_state

  end

  def button_down(id)
    @current_state.button_down(id)
  end
end