class CollisionEngine
  def self.check(player)
    baddies = Enemies.enemies + Bullets.enemy_bullets
    goodies = [player] + Bullets.player_bullets
    baddies.each do |b|
      goodies.each do |g|
        if b.collide?(g)
          b.collide(g)
          g.collide(b)
        end
      end
    end
  end
end
