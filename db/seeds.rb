# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Creating admin user
User.create!(name:  "Admin User",
             email: "example@railstutorial.org",
             city:"Santa Barbara",
             age: 25,
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

## Creating Normal User
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  city = Faker::Address.city
  password = "password"
  User.create!(name:  name,
               email: email,
               age: 25,
               city: city,
               password:              password,
               password_confirmation: password)
end

## Creating Tags
35.times do |n|
  name  = Faker::GameOfThrones.house #=> "Stark"
  description = Faker::GameOfThrones.dragon #=> "Drogon"
  Tag.create!(name:  name,
               description: description)
end

## Creating Locations
35.times do |n|
  name = Faker::GameOfThrones.city ## using name of the city for the name of address
  address = Faker::Address.street_address
  city = Faker::Address.city
  capacity= Faker::Number.between(50 ,500)
  email=Faker::Internet.email
  phone=Faker::Number.number(10)

  Location.create(name:name,address:address,city:city,capacity:capacity,email:email,phone:phone)
end

## Creating events
50.times do |n|
  tag_id = Faker::Number.between(1,34)
  location_id= Faker::Number.between(1,34)
  user_id = Faker::Number.between(1,99)
  title= Faker::GameOfThrones.character
  description = Faker::GameOfThrones.quote
  price= Faker::Number.between(10,100)
  date=Faker::Date.forward(25)

  Event.create(title:title,description:description,tag_id:tag_id,
              location_id:location_id,date:date,
              price:price,user_id:user_id)



end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
