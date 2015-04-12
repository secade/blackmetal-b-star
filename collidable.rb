module Collidable
  def collide?(collidable)
    if collidable.type == :player
      collision?(collidable) && self.class != Player
    else
      collision?(collidable) && self.class == Player
    end
  end

  def collision?(collidable)
    (@x - collidable.x).abs <= @width && (@y - collidable.y).abs <= @height
  end
end