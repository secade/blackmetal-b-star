module Color
  def self.create
    color = Gosu::Color.new(0xff000000)
    color.red = rand(256 - 40) + 40
    color.green = rand(256 - 40) + 40
    color.blue = rand(256 - 40) + 40
    color
  end

  White = 0xffffffff

  Black = 0xff000000

  Red = 0xffff0000

  Green = 0xff00ff00

  Null = 0xffffffff
end