# User seed

puts 'Destroying all rentals.'
Rental.destroy_all
puts 'Destroying all listings.'
Listing.destroy_all
puts 'Destroying all users.'
User.destroy_all

emails = %w[a@a.a b@b.b c@c.c d@d.d e@e.e]
usernames = %w[a b c d e]

emails.each_with_index do |email, index|
  User.create!(
    email: email,
    password: '123456',
    username: usernames[index],
    address: Faker::Address.street_address,
    avatar: Faker::Avatar.image
  )
  puts "User #{index + 1} was created."
end

puts "All done! You now have #{User.count} users!"

# Listing seed
user_id_array = User.all.collect { |obj| obj.id }

# Listing 1
Listing.create!(
  name: '2x QSC K12 Speakers',
  description: '2 brand new QSC K12 powered speakers. Near-mint condition.',
  price: 150.00,
  available: true,
  category: 'Powered Speakers',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387442/seed1.jpg"
)

# Listing 2
Listing.create!(
  name: '2x Pioneer CDJ 2000 NXS2',
  description: '2 brand new Pioneer CDJ 2000 NXS2 CD Players. Near-mint condition.',
  price: 200.00,
  available: true,
  category: 'CD and USB Players',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387431/seed2.jpg"
)

# Listing 3
Listing.create!(
  name: 'ALLEN & HEATH Xone K2 DJ Controller',
  description: '1 ALLEN & HEATH XONE K2. Good condition.',
  price: 42.50,
  available: true,
  category: 'DJ Controllers',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387415/seed3.jpg"
)

# Listing 4
Listing.create!(
  name: 'JBL LSR 310S Studio Subwoofer',
  description: 'Great subwoofer for studio purposes. Perfect condition.',
  price: 87.50,
  available: true,
  category: 'Subwoofers',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387407/seed4.jpg"
)

# Listing 5
Listing.create!(
  name: '2x JBL LSR 305 Studio Monitors',
  description: 'Great sounding studio monitors. Near mint condition.',
  price: 50.00,
  available: true,
  category: 'Studio Monitors',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387370/seed5.jpg"
)

# Listing 6
Listing.create!(
  name: 'Pioneer DJM900NXS2 Mixer',
  description: 'Used but in good condition.',
  price: 125.00,
  available: true,
  category: 'DJ Mixers',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387365/seed6.jpg"
)

# Listing 7
Listing.create!(
  name: 'ALLEN & HEATH Xone 92 Mixer',
  description: 'Used but in great condition. No defects.',
  price: 100.00,
  available: true,
  category: 'DJ Mixers',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387334/seed7.jpg"
)

# Listing 8
Listing.create!(
  name: 'Technics SL1200-MK2 Turntable',
  description: 'Single turntable. Comes with Technics cartridge.',
  price: 80.00,
  available: true,
  category: 'Turntables',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387285/seed8.jpg"
)

# Listing 9
Listing.create!(
  name: 'Audio Technica M50x Headphones',
  description: 'Barely used. Sound amazing!',
  price: 40.00,
  available: true,
  category: 'Headphones',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387273/seed9.jpg"
)

# Listing 10
Listing.create!(
  name: 'Pioneer DDJ-SX DJ Controller',
  description: 'Mint condition. Works with Serato and Rekordbox.',
  price: 40.00,
  available: true,
  category: 'DJ Controllers',
  user_id: user_id_array.sample,
  photo: "https://res.cloudinary.com/dploqe2ts/image/upload/v1629387261/seed10.jpg"
)

puts "All done! You now have #{Listing.count} listings!"

# Rental seed
listing_id_array = Listing.all.collect { |obj| obj.id }

15.times do
  date = Date.current + rand(-10...30)
  if date < Date.current
    status = "Completed"
  else
    status = %w[Pending Approved Denied].sample
  end

  Rental.create!(
    from: date,
    until: date + rand(1..7),
    status: status,
    user_id: user_id_array.sample,
    listing_id: listing_id_array.sample
  )
end

puts "All done! You now have #{Rental.count} rentals!"
