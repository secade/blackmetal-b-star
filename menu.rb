class Menu
  Multi = 2
  MenuGap = 50
  attr_accessor :cursor

  def initialize(game)
    @game = game
    @cursor = 0
    @w, @h, @b = Game::CANVAS_W / 2, Game::CANVAS_H / 3 * 2, 25
    @x, @y = (Game::CANVAS_W - @w) / 2, (Game::CANVAS_H - @h) / 2 
    @title = game.images.fonts.title
    @text = game.images.fonts.text
    @fh = @title.height
    @fx, @fy = (Game::CANVAS_W - 394) / 2, (Game::CANVAS_H - @h) / 8
    @color = Color::TitleStart
    @color_mode = :white # :white, :red, :blue, :green
    @current_list = Difficulty::Names
  end

  def update
    tick
  end

  def draw
    draw_title
    draw_boxes
    draw_options
    draw_cursor
  end

  def tick
    case @color_mode
    when :white
      @color.blue -= Multi
      @color.green -= Multi
      @color_mode = :red if @color.blue == 0 && @color.green == 0 && @color.red == 255
    when :red
      @color.red -= Multi
      @color.green += Multi
      @color_mode = :green if @color.red == 0 && @color.blue == 0 && @color.green == 255
    when :green
      @color.green -= Multi
      @color.blue += Multi
      @color_mode = :blue if @color.red == 0 && @color.blue == 255 && @color.green == 0
    when :blue
      @color.red += Multi
      @color.green += Multi
      @color_mode = :white if @color.red == 255 && @color.blue == 255 && @color.green == 255
    end
  end

  def draw_boxes
    @game.draw_quad(@x, @y, Color::TitleBox, @x + @w, @y, Color::TitleBox, @x, @y + @h, Color::TitleBox, @x + @w, @y + @h, Color::TitleBox, ZOrder::TitleBox, :additive)
    @game.draw_quad(@x + @b, @y + @b, Color::TitleBox, @x - @b + @w, @y + @b, Color::TitleBox, @x + @b, @y + @h - @b, Color::TitleBox, @x + @w - @b, @y + @h - @b, Color::TitleBox, ZOrder::TitleBox, :additive)
  end

  def draw_title
    @title.draw("Blackmetal B*", @fx, @fy, ZOrder::Fonts, 2.0, 2.0, @color, :additive)
  end

  def draw_options
    @current_list.each_with_index do |row, i|
      @text.draw(row, @x + @b * 3, @y + @b * 1.5 + i * MenuGap, ZOrder::Fonts, 2.0, 2.0, Color::Black)
    end
  end

  def draw_cursor
    @game.draw_triangle(@x + @b * 1.75, @y + @b * 2.0 + @cursor * MenuGap, @color, @x + @b * 1.75, @y + @b * 2.5 + @cursor * MenuGap, @color, @x + @b * 2.25, @y + @b * 2.25 + @cursor * MenuGap, @color, 7)
  end

  def slide(dir)

  end

  def up
    @cursor == 0 ? @cursor = @current_list.size - 1 : @cursor -= 1
  end

  def down
    @cursor == @current_list.size - 1 ? @cursor = 0 : @cursor += 1
  end
end