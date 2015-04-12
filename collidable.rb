module Collidable
  def collide?(collidable)
    (@x - collidable.x).abs <= @width && (@y - collidable.y).abs <= @height
  end
end

module Tracker
  def self.calc_vectors(speed, angle)
    a = angle * Math::PI / 180 # convert to radians to use Math trig functions
    { x: Math.cos(a) * speed, y: Math.sin(a) * speed }
  end
end