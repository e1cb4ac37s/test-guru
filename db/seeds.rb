categories = 3.times.map { Category.create(title: Faker::Lorem.sentence(word_count: 2)) }

users = 5.times.map do
  user = User.new(email: Faker::Internet.unique.email, password: 'password')
  user.skip_confirmation!
  user.save!
  user
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
  user.created_tests = tests
end
