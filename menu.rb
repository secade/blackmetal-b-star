class Menu
  Multi = 2
  MenuGap = 50
  AnchorX = (Game::CANVAS_W - (Game::CANVAS_W / 2)) / 2
  Speed = 15
  attr_accessor :cursor, :moving, :display_mode

  def initialize(game)
    @game = game
    @cursor = 0
    @w, @h, @b = Game::CANVAS_W / 2, Game::CANVAS_H / 3 * 2, 25
    @x, @y = AnchorX, (Game::CANVAS_H - @h) / 2 
    @title = game.images.fonts.title
    @text = game.images.fonts.text
    @fh = @title.height
    @fx, @fy = (Game::CANVAS_W - 394) / 2, (Game::CANVAS_H - @h) / 8
    @color = Color::TitleStart
    @color_mode = :white # :white, :red, :blue, :green
    @display_mode = :game
    @moving = false
    p @lists = init_lists
    @current_list = @lists.first
  end

  def init_lists
    lists = []
    Difficulty.all.each do |d|
      lists << { name: d.name, items: d.scores.order(score: :desc).limit(5).pluck(:score) }
    end
    lists.unshift(name: 'Game Mode', items: Difficulty.all.pluck(:name))
  end

  def update
    tick
    slide
  end

  def draw
    draw_title
    draw_boxes
    draw_options
    draw_cursor if @display_mode == :game
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

  def start_slide(dir)
    dir == :left ? @display_mode = :slide_l_from_center : @display_mode = :slide_r_from_center 
  end

  def slide
    case @display_mode
    when :slide_l_from_center
      @x -= Speed
      if @x + @w <= 0
        @x = Game::CANVAS_W
        change_list(:left)
        @display_mode = :slide_l_from_right
      end
    when :slide_l_from_right
      @x -= Speed
      if @x <= AnchorX
        @x = AnchorX
        @current_list == @lists.first ? @display_mode = :game : @display_mode = :scores
      end
    when :slide_r_from_center
      @x += Speed
      if @x >= Game::CANVAS_W
        @x = -@w
        change_list(:right)
        @display_mode = :slide_r_from_right
      end
    when :slide_r_from_right
      @x += Speed
      if @x >= AnchorX
        @x =  AnchorX
        @current_list == @lists.first ? @display_mode = :game : @display_mode = :scores
      end
    end
  end

  def change_list(dir)
    i = @lists.index(@current_list)
    if dir == :right
      @current_list == @lists.last ? @current_list = @lists.first : @current_list = @lists[i + 1]
    else
      @current_list == @lists.first ? @current_list = @lists.last : @current_list = @lists[i - 1]
    end
  end

  def up
    @cursor == 0 ? @cursor = @current_list[:items].size - 1 : @cursor -= 1
  end

  def down
    @cursor == @current_list[:items].size - 1 ? @cursor = 0 : @cursor += 1
  end

  def draw_boxes
    @game.draw_quad(@x, @y, Color::TitleBox, @x + @w, @y, Color::TitleBox, @x, @y + @h, Color::TitleBox, @x + @w, @y + @h, Color::TitleBox, ZOrder::TitleBox, :additive)
    @game.draw_quad(@x + @b, @y + @b, Color::TitleBox, @x - @b + @w, @y + @b, Color::TitleBox, @x + @b, @y + @h - @b, Color::TitleBox, @x + @w - @b, @y + @h - @b, Color::TitleBox, ZOrder::TitleBox, :additive)
  end

  def draw_title
    @title.draw("Blackmetal B*", @fx, @fy, ZOrder::Fonts, 2.0, 2.0, @color, :additive)
  end

  def draw_options
    @current_list[:items].each_with_index do |row, i|
      @text.draw("#{row}", @x + @b * 3, @y + @b * 1.5 + i * MenuGap, ZOrder::Fonts, 2.0, 2.0, Color::Black)
    end

    unless @current_list[:name] == 'Game Mode' || @moving
      @text.draw("#{@current_list[:name]} High Scores!", @x, @y + @h  + @b * 1.5, ZOrder::Fonts, 2.0, 2.0, @color)
    end
  end

  def draw_cursor
    @game.draw_triangle(@x + @b * 1.75, @y + @b * 2.0 + @cursor * MenuGap, @color, @x + @b * 1.75, @y + @b * 2.5 + @cursor * MenuGap, @color, @x + @b * 2.25, @y + @b * 2.25 + @cursor * MenuGap, @color, 7)
  end
end