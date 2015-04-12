module Enemies
  @@enemies = []

  def self.enemies
    @@enemies
  end

  def self.create(game, x, y)
    @@enemies << Enemy.new(game, x, y)
  end

  def self.update
    @@enemies.each { |e| e.update }
    self.clean
  end

  def self.draw
    @@enemies.each { |e| e.draw }
  end

  def self.destroy(enemy)
    @@enemies.delete(enemy)
  end

  def self.clean #destroy off-screen enemies
    @@enemies.delete_if do |e|
      e.x + e.width < 0 || e.x > 640 || e.y + e.height < -40 || e.y > 480
    end
  end
end