# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'ffaker'

100.times do
  author = Author.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    email: FFaker::Internet.email,
    phone_number: rand(100000000..999999999)
  )
  author.save
end

100.times do
  book = Book.create(
    tittle: FFaker::Name.first_name,
    year: rand(1500..2023),
    author_id: rand(1..100),
    ISBN_number: rand(100000000..999999999),
    publishing_house: FFaker::Company.name,
    description: FFaker::Lorem.sentence
  )
  book.save
end


