class Game < Gosu::Window
  FIELD_WIDTH = 640
  FIELD_HEIGHT = 480
  attr_accessor :images

  def initialize 
    super 768, 480, false
    self.caption = 'Blackmetal B* Demo'
    @images = Images.new(self)
    @state_machine = StateMachine.new(self)
  end

  def update
    @state_machine.update
  end

  def draw
    @state_machine.draw
  end

  def button_down(id)
    @state_machine.button_down(id)
  end
end
