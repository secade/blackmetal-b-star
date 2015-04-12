module Bullets
  @@bullets = []

  def self.bullets
    @@bullets
  end

  def self.destroy(bullet)
    @@bullets.delete(bullet)
  end

  def self.create(game, x, y)
    @@bullets << Bullet.new(game, x, y)
  end

  def self.update
    @@bullets.each { |b| b.update }
    self.clean
  end

  def self.draw
    @@bullets.each { |b| b.draw }
  end

  def self.clean #destroy off-screen missiles
    @@bullets.delete_if do |b|
      b.x + b.width < 0 || b.x > 640 || b.y + b.height < 0 || b.y > 480
    end
  end
end