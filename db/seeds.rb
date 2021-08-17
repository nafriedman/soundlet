# User seed

puts 'Destroying all users!'
User.destroy_all

emails = %w[a@a.a b@b.b c@c.c d@d.d e@e.e]
usernames = %w[a b c d e]

emails.each_with_index do |email, index|
  User.create!(
    email: email,
    password: '123456',
    username: usernames[index],
    address: Faker::Address.street_address
  )
  puts "User #{index + 1} was created."
end

puts "All done! You now have #{User.count} users!"

# Listing seed
user_id_array = User.all.collect { |obj| obj.id }

puts 'Destroying all listings!'
Listing.destroy_all

Listing.create!(
  name: '2 QSC K12 Speakers',
  description: '2 brand new QSC K12 powered speakers. Near-mint condition.',
  price: '150.00',
  available: true,
  category: 'Speakers',
  user_id: user_id_array.sample,
  photo: "../app/assets/images/listing1-qsck12.jpeg"
)
