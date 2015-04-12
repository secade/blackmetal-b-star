class CollisionEngine
  def initialize(player, enemies, missiles)
    @player = player
    @enemies = enemies
    @missiles = missiles
  end

  def update
    collision_check
  end

  def collision_check
    @enemies.enemies.each do |e|
      Missiles.bullets.each do |b|
        if e.collide?(b)
          puts 'collide'
          b.collide
          # @missiles.destroy(b)
          # Enemies.destroy(e)
        end
      end
    end
  end
end