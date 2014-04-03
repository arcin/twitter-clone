10.times do
  User.create(
    username: Faker::Internet.user_name,
    password: Faker::Internet.password(10)
    )
end

50.times do
  Tweet.create(
    text: Faker::Lorem.characters(char_count = 100),
    user_id: rand(1..10)
  )
end

15.times do
  Follower.create(
    user_id: rand(1..10),
    follower_id: rand(1..10)
  )
end