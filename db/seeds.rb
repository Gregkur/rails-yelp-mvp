require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = %w[chinese italian japanese french belgian]
puts "Deleting restaurants..."
puts "..."
puts "..."
puts "Finished!"
puts "..."
puts "..."

Restaurant.destroy_all

puts "Creating restaurants"
puts "..."
puts "..."

island_grill = {
  name: 'Island Grill',
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: categories.sample
}
flavo = {
  name: 'Flavo',
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: categories.sample
}
burgers_boy = {
  name: 'Burgers Boy',
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: categories.sample
}
cortana = {
  name: 'Cortana',
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: categories.sample
}
fishy = {
  name: 'Fishy',
  address: Faker::Address.full_address,
  phone_number: Faker::PhoneNumber.phone_number,
  category: categories.sample
}

[ island_grill, flavo, burgers_boy, cortana, fishy ].each do |attributes|
    restaurant = Restaurant.create!(attributes)
    puts "Created #{restaurant.name}"
  end
puts "Finished!"
