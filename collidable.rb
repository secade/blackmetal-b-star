module Collidable
  def collide?(collidable)
    (@x - collidable.x).abs <= @width && (@y - collidable.y).abs <= @height
  end
end
