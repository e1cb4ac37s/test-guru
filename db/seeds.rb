# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = 3.times.map { Category.create(title: Faker::Lorem.sentence(word_count: 2)) }

users = 5.times.map do
  User.new(
    email: Faker::Internet.unique.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end

users.each do |user|
  tests = 3.times.map do |i|
    test = Test.create(
      title: Faker::Lorem.sentence(word_count: 3),
      level: Faker::Number.within(range: 0..10),
      category: categories[i],
      author: users.sample
    )
    3.times do
      question = Question.create(body: Faker::Lorem.question(word_count: 5), test: test)
      4.times { |answer_index| Answer.create(body: Faker::Lorem.sentence(word_count: 3), correct: answer_index == 2, question: question) }
    end
    test
  end
  user.tests = tests
  user.save
end
