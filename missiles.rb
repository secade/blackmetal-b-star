class Missiles
  def self.destroy(bullet)
    @bullets.delete(bullet)
  end

  def initialize(game)
    @game = game
    @bullets = []
  end

  def create(x, y)
    @bullets << Bullet.new(@game, x, y)
  end

  def update
    @bullets.each { |b| b.update }
    clean
  end

  def draw
    @bullets.each { |b| b.draw }
  end

  private

  def clean #destroy off-screen missiles
    @bullets.delete_if do |b|
      b.x + b.width < 0 || b.x > 640 || b.y + b.height < 0 || b.y > 480
    end
  end
end