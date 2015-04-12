class CollisionEngine
  def self.check(player)
    baddies = Enemies.enemies + Bullets.enemy_bullets
    goodies = [player] + Bullets.player_bullets
    baddies.each do |c|
      goodies.each do |b|
        if c.collide?(b)
          b.collide
          c.collide
        end
      end
    end
  end
end
