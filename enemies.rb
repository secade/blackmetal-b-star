class Enemies
  attr_accessor :enemies

  def initialize(game)
    @game = game
    @enemies = []
  end

  def create(x, y)
    @enemies << Enemy.new(@game, x, y)
  end

  def update
    if rand(100) < 4 && @enemies.size < 25
      generate
    end
    @enemies.each { |e| e.update }
    clean
  end

  def draw
    @enemies.each { |e| e.draw }
  end

  def destroy(enemy)
    @enemies.delete(enemy)
  end

  private

  def generate
    create(rand(8..600), -32)
  end

  def clean #destroy off-screen enemies
    @enemies.delete_if do |e|
      e.x + e.width < 0 || e.x > 640 || e.y + e.height < -40 || e.y > 480
    end
  end
end