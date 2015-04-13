module Enemies
  @@enemies = []

  def self.enemies
    @@enemies
  end

  def self.create(game, x, y, type)
    case type
    when :small
      @@enemies << Enemy.new(game, x, y)
    when :turret
      @@enemies << Turret.new(game, x, y)
    end
  end

  def self.small_count
    @@enemies.select {|e| e.class == Enemy }.size
  end

  def self.update
    @@enemies.each { |e| e.update }
    self.clean
  end

  def self.draw
    @@enemies.each { |e| e.draw }
  end

  def self.destroy(enemy)
    Player.score_up(enemy.value)
    @@enemies.delete(enemy)
  end

  def self.destroy_all
    @@enemies.clear
  end

  def self.clean
    @@enemies.delete_if(&:off_screen?)
  end
end