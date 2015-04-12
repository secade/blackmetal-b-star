class Background 
  def initialize(game)
    @map = Gosu::Image::load_tiles(game, "assets/img/space.jpg", 320, 1080, false)
    @frame = 0
    calc_images

    @y = -1080 * 2 - 480
    @vel = 8
  end

  def update
    reset_picture if switch_frame?(@y)  
    @y += @vel
  end

  def draw
    @image_above.draw(0, @y, ZOrder::Background, 2, 2)
    @image_below.draw(0, @y + 1080 * 2, ZOrder::Background, 2, 2)
  end

  private

  def calc_images
    @image_above = @map[(@frame + 1) % 6]
    @image_below = @map[@frame + 0]
  end

  def switch_frame?(y)
    y >= 0
  end

  def reset_picture
    @y = -1080 * 2
    @frame = (@frame + 1) % 6
    calc_images
  end
end