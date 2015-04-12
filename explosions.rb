module Explosions
  @@explosions = []

  def self.explosions
    @@explosions
  end

  def self.destroy(explosion)
    @@explosions.delete(explosion)
  end

  def self.create(game, x, y, x_dis, y_dis, type = :bullet)
    case type
    when :bullet
      @@explosions << Explosion.new(game, x, y, x_dis, y_dis)
    when :contact
      @@explosions << ExplosionContact.new(game, x, y, x_dis, y_dis)
    end
  end

  def self.update
    @@explosions.each { |e| e.update }
  end

  def self.draw
    @@explosions.each { |e| e.draw }
  end
end