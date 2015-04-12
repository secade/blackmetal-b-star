module Color
  def self.create
    color = Gosu::Color.new(0xff000000)
    color.red = rand(256 - 40) + 40
    color.green = rand(256 - 40) + 40
    color.blue = rand(256 - 40) + 40
    color
  end
end
