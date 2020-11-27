
puts "Cleaning all the DBs..."

Restaurant.destroy_all
Review.destroy_all

puts "DBs are clean"

puts "creating restaurants..."
10.times do
  restaurant = Restaurant.create(
                name: Faker::Restaurant.name,
                address: Faker::Address.street_address,
                phone_number: Faker::PhoneNumber.phone_number_with_country_code,
                category: ["chinese", "italian", "japanese", "french", "belgian"].sample
                )

  puts "#{restaurant.id}-#{restaurant.name} was created"
end

puts "creating reviews..."
100.times do
  restaurant = Restaurant.all.sample
  review = Review.create(content: Faker::Lorem.paragraph(sentence_count: 8),rating: rand(0..5),restaurant_id: restaurant.id)
  puts "Review created for '#{restaurant.name}' restaurant'"
end
