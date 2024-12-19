# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Vote.delete_all
Answer.delete_all
Poll.delete_all
User.delete_all

# Create Admin User
admin = User.create!(
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

# Create Normal User
user = User.create!(
  email: "user@example.com",
  password: "password",
  password_confirmation: "password",
  admin: false
)

# Create Polls with Answers
poll1 = Poll.create!(question: "What is your favorite cuisine?")
poll1.answers.create!(text: "Italian")
poll1.answers.create!(text: "Mexican")
poll1.answers.create!(text: "Japanese")
poll1.answers.create!(text: "Indian")

poll2 = Poll.create!(question: "Which programming language do you prefer?")
poll2.answers.create!(text: "Ruby")
poll2.answers.create!(text: "JavaScript")
poll2.answers.create!(text: "Python")
poll2.answers.create!(text: "Go")

poll3 = Poll.create!(question: "What's your preferred vacation type?")
poll3.answers.create!(text: "Beach")
poll3.answers.create!(text: "Mountains")
poll3.answers.create!(text: "City")
poll3.answers.create!(text: "Countryside")

puts "Seeding completed successfully!"

