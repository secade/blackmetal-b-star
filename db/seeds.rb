difficulties = [
  {name: 'Cake', max: 0.2, gen: 0.2, speed: 0.2, fire_rate: 0.2, fire_speed: 0.2, enviro: 0.0},
  {name: 'Easy', max: 0.5, gen: 0.5, speed: 0.5, fire_rate: 0.5, fire_speed: 0.5, enviro: 0.0},
  {name: 'Standard', max: 1.0, gen: 1.0, speed: 1.0, fire_rate: 1.0, fire_speed: 1.0, enviro: 1.0},
  {name: 'Hard', max: 1.25, gen: 1.25, speed: 1.25, fire_rate: 1.25, fire_speed: 1.25, enviro: 1.25},
  {name: 'Hell', max: 2.0, gen: 2.0, speed: 2.0, fire_rate: 2.0, fire_speed: 2.0, enviro: 2.0}
].map do |hash|
  Difficulty.create!(hash)
end

difficulties.each do |d|
  5.times do
    d.scores.create(score: 0)
  end
end