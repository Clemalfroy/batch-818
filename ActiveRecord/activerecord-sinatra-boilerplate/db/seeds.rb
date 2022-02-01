require 'faker'

puts 'Creating Restaurants...'

5.times do
  resto =
    Restaurant.new(
      name: Faker::Restaurant.name,
      city: Restaurant::CITIES.sample,
      rating: rand(0..10)
    )
  resto.save!
end

puts 'All done!'
