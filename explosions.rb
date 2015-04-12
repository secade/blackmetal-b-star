module Explosions
  @@explosions = []

  def self.explosions
    @@explosions
  end

  def self.destroy(explosion)
    @@explosions.delete(explosion)
  end

  def self.create(game, x, y)
    @@explosions << Explosion.new(game, x, y)
  end

  def self.update
    @@explosions.each { |e| e.update }
  end

  def self.draw
    @@explosions.each { |e| e.draw }
  end
end