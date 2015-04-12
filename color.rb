module Color
  def self.create
    color = Gosu::Color.new(0xff000000)
    color.red = rand(256 - 40) + 40
    color.green = rand(256 - 40) + 40
    color.blue = rand(256 - 40) + 40
    color
  end

  def self.white
    0xffffffff
  end

  def self.black
    0xff000000
  end

  def self.null
    0xFFffffff
  end
end
