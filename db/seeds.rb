# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
random_name = RandomNameGenerator.new(RandomNameGenerator::ELVEN)

2.times do
  Kitten.create(name: random_name.compose(2), age: rand(1..10), cuteness: rand(1..10), softness: rand(1..10))
end
