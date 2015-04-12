class Background 
  def initialize(game, scrolling = true)
    @game = game
    load_map(scrolling)
    calc_images if scrolling
    @frame = 0

    @y = -1080 * 2 - 480
    @vel = 4

    @scrolling = scrolling
  end

  def update
    if @scrolling
      reset_picture if switch_frame?(@y)  
      @y += @vel
    end
  end

  def draw
    if @scrolling
      @image_above.draw(0, @y, ZOrder::Background, 2, 2)
      @image_below.draw(0, @y + 1080 * 2, ZOrder::Background, 2, 2)
    else
      @map.draw_as_quad(0, 0, Color.null, Game::CANVAS_W, 0, Color.null, 0, Game::CANVAS_H, Color.null, Game::CANVAS_W, Game::CANVAS_H, Color.null, ZOrder::Background)
    end
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

  def load_map(scrolling)
    if scrolling 
      @map = @game.images.maps.space_tiles
    else
      @map = @game.images.maps.space_img
    end
  end
end