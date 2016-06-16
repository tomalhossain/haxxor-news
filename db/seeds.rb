100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do 
  title = Faker::Lorem.sentence(5)
  url = "http://tomalhossain.github.io/"
  users.each { |user| user.posts.create!(title: title, url: url) } 
end 