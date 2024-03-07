# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create 10 users using Devise

puts "Clearing the DB"
Booking.destroy_all
Sizzler.destroy_all
User.destroy_all
puts "Creating the Users"
10.times do |i|
  User.create!(
    email: Faker::Internet.email,
    password: "password", # Set a default password for simplicity
    password_confirmation: "password"
  )
end
puts "Creating the Sizzlers"
# Create 10 Sizzler instances, each one assigned to a random user
10.times do
  Sizzler.create!(
    title: Faker::Company.name,
    location: Faker::Address.city,
    cooking_style: ["Charcoal", "Wood", "Gas", "Hibachi grill"].sample,
    price: Faker::Commerce.price,
    speciality: ["Seafood", "Traditional", "Sosatie", "Potjiekos", "Boerewors", "Braaibroodjies", "Vegetarian"].sample,
    user_id: User.pluck(:id).sample
  )
end
puts "done!"
