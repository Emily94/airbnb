# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users

user = {}
user['password'] = 'ilovecats'



ActiveRecord::Base.transaction do
  20.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['birth_date'] = Faker::Date.between(80.years.ago, Date.today)

    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['property_type'] = ["Entire place", "Private room", "Shared room"].sample
    listing['max_guest_number'] = rand(0..16)

    listing['country'] = Faker::Address.country
    listing['city'] = Faker::Address.city

    listing['price'] = rand(80..800)
    listing['description'] = Faker::Hipster.paragraph

    listing['user_id'] = uids.sample

    Listing.create(listing)
  end
end