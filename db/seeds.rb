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

User.create(nickname: 'Admin',name: 'Admin', surname:'SuperAdmin',
             password: '12345678',password_confirmation: '12345678',
             role: :admin, age: 33, city: City.all.sample, email: 'Admin@gmail.com')
User.create(nickname: 'Writer',name: 'Writer', surname:'SuperWriter',
            password: '12345678',password_confirmation: '12345678',
            role: :author, age: 33, city: City.all.sample, email: 'Writer@gmail.com')
User.create(nickname: 'User',name: 'User', surname:'SuperUser',
            password: '12345678',password_confirmation: '12345678',
            role: :user, age: 33, city: City.all.sample, email: 'User@gmail.com')


100.times {Item.create(name: Faker::Cat.name,
                       category: Category.all.sample,
                       description: Faker::GameOfThrones.quote,
                       user_id: User.all.sample.id)}