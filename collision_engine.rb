class CollisionEngine
  def self.check(player)
    collidables = Enemies.enemies + [player]
    collidables.each do |c|
      Bullets.bullets.each do |b|
        if c.collide?(b)
          b.collide
          c.collide
        end
      end
    end
  end
end