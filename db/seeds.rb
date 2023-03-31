# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "💤..seed ninja...🥷"

15.times do

    Tenant.create(
        "username": Faker::Name.name,
        "email": Faker::Internet.email,
        "identification": Faker::IDNumber.valid,
        "password_digest": Faker::Alphanumeric.alpha(number: 5)
    )

   landlord = Landlord.create(
        "username": Faker::Name.name,
        "contact_number": Faker::PhoneNumber.cell_phone,
        "email": Faker::Internet.email,
        "password_digest": Faker::Alphanumeric.alpha(number: 5)
    )

    Apartment.create(
        "name": Faker::Lorem.words(number: 1),
        "location": Faker::Address.full_address,
        "category": Faker::Lorem.words(number: 1),
        "landlord_id": landlord.id

    )

    House.create(
        "image_url": Faker::Avatar.image,
        "house_number": Faker::Address.secondary_address,
        "description": Faker::Lorem.sentence(word_count: 10), 
        "rent": rand(12000.0..90000.0),
        "apartment_id": rand(1..15)
    )

    3.times do
        Review.create(
        "rating": rand(1..5),
        "description": Faker::Lorem.sentence(word_count: 10),
        "tenant_id": rand(1..15),
        "house_id": rand(1..15)
     )
    end

end


puts "🤾 . dusted. . 😅"