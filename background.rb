class Background 
  def initialize(game)
    @background_image = Gosu::Image.new(game, "assets/img/space.jpg", true)
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
  end
end