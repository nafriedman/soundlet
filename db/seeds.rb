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

puts 'Destroying all listings.'
Listing.destroy_all

# Listing 1
Listing.create!(
  name: '2x QSC K12 Speakers',
  description: '2 brand new QSC K12 powered speakers. Near-mint condition.',
  price: '150.00',
  available: true,
  category: 'Powered Speakers',
  user_id: user_id_array.sample,
  photo: "../app/assets/images/listing1-qsck12.jpeg"
)

# Listing 2
Listing.create!(
  name: '2x Pioneer CDJ 2000 NXS2',
  description: '2 brand new Pioneer CDJ 2000 NXS2 CD Players. Near-mint condition.',
  price: '200.00',
  available: true,
  category: 'CD and USB Players',
  user_id: user_id_array.sample,
  photo: "../app/assets/images/listing2-cdj2000nxs2.jpeg"
)

# Listing 3
Listing.create!(
  name: 'ALLEN & HEATH XONE K2 DJ Controller',
  description: '1 ALLEN & HEATH XONE K2. Good condition.',
  price: '42.50',
  available: true,
  category: 'DJ Controllers',
  user_id: user_id_array.sample,
  photo: "../app/assets/images/listing3-xonek2.jpeg"
)

# Listing 4
Listing.create!(
  name: 'JBL LSR 310S Studio Subwoofer',
  description: 'Great subwoofer for studio purposes. Perfect condition.',
  price: '87.50',
  available: true,
  category: 'Subwoofers',
  user_id: user_id_array.sample,
  photo: "../app/assets/images/listing4-lsr310s.jpeg"
)


# Listing 5
Listing.create!(
  name: '2x JBL LSR 305 Studio Monitors',
  description: 'Great sounding studio monitors. Near mint condition.',
  price: '50.00',
  available: true,
  category: 'Studio Monitors',
  user_id: user_id_array.sample,
  photo: "../app/assets/images/listing5-lsr305.jpeg"
)
# Listing 6

# Listing 7

# Listing 8

# Listing 9

# Listing 10
