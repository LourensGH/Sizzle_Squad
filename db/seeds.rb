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
    name: Faker::Name.first_name,
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
      "123 Long Street, Cape Town, 8000",
      "456 Main Road, Sea Point, Cape Town, 8005",
      "789 Victoria Road, Camps Bay, Cape Town, 8040",
      "10 Beach Avenue, Mouille Point, Cape Town, 8001",
      "15 High Street, Green Point, Cape Town, 8051",
      "20 Church Street, Woodstock, Cape Town, 7915",
      "35 Market Street, Bo-Kaap, Cape Town, 8000",
      "40 Kloof Street, Gardens, Cape Town, 8001",
      "55 Bree Street, Cape Town City Centre, Cape Town, 8000",
      "70 Wale Street, Cape Town City Centre, Cape Town, 8001",
      "85 Loop Street, Cape Town City Centre, Cape Town, 8000",
      "100 Main Road, Observatory, Cape Town, 7925",
      "115 Strand Street, Cape Town City Centre, Cape Town, 8000",
      "120 Sir Lowry Road, Woodstock, Cape Town, 7915",
      "135 Buitengracht Street, Cape Town City Centre, Cape Town, 8000",
      "150 Regent Road, Sea Point, Cape Town, 8005",
      "165 Main Road, Green Point, Cape Town, 8051",
      "180 Long Street, Cape Town City Centre, Cape Town, 8000",
      "195 Kloof Nek Road, Tamboerskloof, Cape Town, 8001",
      "200 Adderley Street, Cape Town City Centre, Cape Town, 8000"
    ].sample,
    cooking_style: ["Charcoal", "Wood", "Gas", "Hibachi grill"].sample,
    price: Faker::Commerce.price(range: 100..500),
    speciality: ["Seafood", "Traditional", "Sosatie", "Potjiekos", "Boerewors", "Braaibroodjies", "Vegetarian"].sample,
    user_id: User.pluck(:id).sample,
    user_photos: [
      "https://images.unsplash.com/photo-1554306297-0c86e837d24b?q=80&w=2036&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1682285866620-7213160e1ba8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1534797258760-1bd2cc95a5bd?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1504564321107-4aa3efddb5bd?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1602945072887-1171e7ce1450?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1588182657969-777d766e31ab?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1526939615915-ba16b7ad9013?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1500220959218-81a28e9292d0?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1528052265763-a800584f3472?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1542356714-e9158d92487e?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1551218808-94e220e084d2?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1682285866539-ce802e461c9e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1685161456862-bb980e5a8200?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1663011511161-22eea0cb8564?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1676550908362-d58250d35d73?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1676550908028-05c59c4b0569?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ].sample(6)
  )
end
puts "done!"
