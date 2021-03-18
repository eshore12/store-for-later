require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Store.destroy_all
puts "All stores deleted..."

puts "Creating stores..."

10.times do
  store = Store.create!(
    name: Faker::JapaneseMedia::StudioGhibli.character
  )

  file = URI.open("https://picsum.photos/seed/picsum/200/300")

  puts "attaching photos..."
  store.photo.attach(io: file, filename: 'shop.jpg', content_type: 'image/jpg' )

end

puts "All stores created"