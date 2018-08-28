# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cities = %w[Lviv Kyiv Ternopil' Rudno]
cities.each do|city|
  City.create(title: city)
end
categities = %w[technicis sport software]

categities.each do |categoty|
  Category.create(title: categoty)
end


