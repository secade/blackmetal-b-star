module Color
  def self.create
    color = Gosu::Color.new(0xff000000)
    color.red = rand(256 - 40) + 40
    color.green = rand(256 - 40) + 40
    color.blue = rand(256 - 40) + 40
    color
  end

  def self.darken(color)
    color.red = 256 - color.red
    color.blue = 256 - color.blue
    color.green = 256 - color.green
    color
  end

  White = 0xffffffff

  Black = 0xff000000

  Red = 0xffff0000

  Green = 0xff00ff00

  Blue = 0xff0000ff

  Null = 0xffffffff

  TitleBox = 0x99999999

  TitleStart = Gosu::Color.new(0xffffffff)
end