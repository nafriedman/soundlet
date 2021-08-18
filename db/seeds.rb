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
    address: Faker::Address.street_address
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
  photo: "https://www.gearank.com/sites/default/files/QSC-K12-2.jpg"
)

# Listing 2
Listing.create!(
  name: '2x Pioneer CDJ 2000 NXS2',
  description: '2 brand new Pioneer CDJ 2000 NXS2 CD Players. Near-mint condition.',
  price: 200.00,
  available: true,
  category: 'CD and USB Players',
  user_id: user_id_array.sample,
  photo: "https://u.cdn.sera.to/content/images/29/22229/22229_article_big.jpeg"
)

# Listing 3
Listing.create!(
  name: 'ALLEN & HEATH Xone K2 DJ Controller',
  description: '1 ALLEN & HEATH XONE K2. Good condition.',
  price: 42.50,
  available: true,
  category: 'DJ Controllers',
  user_id: user_id_array.sample,
  photo: "https://static.bhphoto.com/images/images500x500/Allen_Heath_XONE_K2_Xone_K2_Professional_DJ_MIDI_1327576972_840780.jpg"
)

# Listing 4
Listing.create!(
  name: 'JBL LSR 310S Studio Subwoofer',
  description: 'Great subwoofer for studio purposes. Perfect condition.',
  price: 87.50,
  available: true,
  category: 'Subwoofers',
  user_id: user_id_array.sample,
  photo: "https://i.ytimg.com/vi/mh82BFqkzE4/maxresdefault.jpg"
)

# Listing 5
Listing.create!(
  name: '2x JBL LSR 305 Studio Monitors',
  description: 'Great sounding studio monitors. Near mint condition.',
  price: 50.00,
  available: true,
  category: 'Studio Monitors',
  user_id: user_id_array.sample,
  photo: "https://i.ytimg.com/vi/AUBnKyoudlo/maxresdefault.jpg"
)

# Listing 6
Listing.create!(
  name: 'Pioneer DJM900NXS2 Mixer',
  description: 'Used but in good condition.',
  price: 125.00,
  available: true,
  category: 'DJ Mixers',
  user_id: user_id_array.sample,
  photo: "https://m.media-amazon.com/images/I/71GCSeOKQqL._AC_SL1500_.jpg"
)

# Listing 7
Listing.create!(
  name: 'ALLEN & HEATH Xone 92 Mixer',
  description: 'Used but in great condition. No defects.',
  price: 100.00,
  available: true,
  category: 'DJ Mixers',
  user_id: user_id_array.sample,
  photo: "https://i.redd.it/e5g7hqaklkt01.png"
)

# Listing 8
Listing.create!(
  name: 'Technics SL1200-MK2 Turntable',
  description: 'Single turntable. Comes with Technics cartridge.',
  price: 80.00,
  available: true,
  category: 'Turntables',
  user_id: user_id_array.sample,
  photo: "https://i.ytimg.com/vi/rFeMMJlXplY/maxresdefault.jpg"
)

# Listing 9
Listing.create!(
  name: 'Audio Technica M50x Headphones',
  description: 'Barely used. Sound amazing!',
  price: 40.00,
  available: true,
  category: 'Headphones',
  user_id: user_id_array.sample,
  photo: "https://i.ytimg.com/vi/0c4E2LbrT_I/maxresdefault.jpg"
)

# Listing 10
Listing.create!(
  name: 'Pioneer DDJ-SX DJ Controller',
  description: 'Mint condition. Works with Serato and Rekordbox.',
  price: 40.00,
  available: true,
  category: 'DJ Controllers',
  user_id: user_id_array.sample,
  photo: "https://i.ytimg.com/vi/ZIMZpuk6Rr4/maxresdefault.jpg"
)

puts "All done! You now have #{Listing.count} listings!"

# Rental seed
listing_id_array = Listing.all.collect { |obj| obj.id }

15.times do
  date = Date.current + rand(-10...30)
  if date < Date.current
    status = "completed"
  else
    status = %w[pending approved denied].sample
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
