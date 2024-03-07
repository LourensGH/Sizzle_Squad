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
    title: "#{Faker::Name.first_name } #{Faker::Name.last_name }",
    location: [
      "1 Adderley St, Cape Town City Centre, Cape Town, 8000, South Africa",
      "Corner of Darling and Bree St, Cape Town City Centre, Cape Town, 8000, South Africa",
      "81 Long St, Cape Town City Centre, Cape Town, 8000, South Africa",
      "10-12 Victoria Rd, Camps Bay, Cape Town, 8005, South Africa",
      "Corner of Wale St and Burg St, Cape Town City Centre, Cape Town, 8000, South Africa",
      "15 New Church St, Cape Town City Centre, Cape Town, 8001, South Africa",
      "V&A Waterfront, 19 Dock Rd, Victoria & Alfred Waterfront, Cape Town, 8001, South Africa",
      "35 Victoria Rd, Camps Bay, Cape Town, 8005, South Africa",
      "1 Beach Rd, Mouille Point, Cape Town, 8005, South Africa",
      "67 Strand St, Cape Town City Centre, Cape Town, 8000, South Africa"
    ].sample,
    cooking_style: ["Charcoal", "Wood", "Gas", "Hibachi grill"].sample,
    price: Faker::Commerce.price(range: 100..500),
    speciality: ["Seafood", "Traditional", "Sosatie", "Potjiekos", "Boerewors", "Braaibroodjies", "Vegetarian"].sample,
    user_id: User.pluck(:id).sample
  )
end
puts "done!"
