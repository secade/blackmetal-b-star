class Game < Gosu::Window
  CANVAS_W = 768
  CANVAS_H = 480
  FIELD_W = 640
  FIELD_H = 480
  attr_accessor :images, :state_machine

  def initialize 
    super CANVAS_W, CANVAS_H, false
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
