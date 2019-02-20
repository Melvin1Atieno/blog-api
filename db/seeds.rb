3.times do
    User.create({
        username: Faker::Name.first_name,
        password: Faker::Crypto.md5,
        full_name: Faker::Name.name
    })
end 
