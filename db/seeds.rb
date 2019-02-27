user1 = User.create({
        username: Faker::Name.first_name,
        password: Faker::Crypto.md5,
        full_name: Faker::Name.name
    }) 

posts = 5.times do 
    user.posts.create({
        title: Faker::Movies::HarryPotter.character,
        text:  Faker::Movies::HarryPotter.quote
    })
end










