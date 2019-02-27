user1 = User.create({
        username: Faker::Name.first_name,
        password: Faker::Crypto.md5,
        full_name: Faker::Name.name
    }) 

user2 = User.create({
    username: Faker::Name.first_name,
    password: Faker::Crypto.md5,
    full_name: Faker::Name.name
}) 
user3 = User.create({
        username: Faker::Name.first_name,
        password: Faker::Crypto.md5,
        full_name: Faker::Name.name
    }) 

user_1_posts = 5.times do 
    user1.posts.create({
        title: Faker::Movies::HarryPotter.character,
        text:  Faker::Movies::HarryPotter.quote
    })
end
user_2_posts = 5.times do 
    user2.posts.create({
        title: Faker::Movies::HarryPotter.character,
        text:  Faker::Movies::HarryPotter.quote
    })
end


comment = 3.times do
    user2.comments.create({
        body: Faker::Quote.yoda
    })
end

comment = 3.times do
    user1.comments.create({
        body: Faker::Quote.most_interesting_man_in_the_world
    })
end











