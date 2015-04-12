class CollisionEngine
  def self.check
    Enemies.enemies.each do |e|
      Bullets.bullets.each do |b|
        if e.collide?(b)
          b.collide
          e.collide
        end
      end
    end
  end
end