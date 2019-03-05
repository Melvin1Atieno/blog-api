FactoryBot.define do
  factory :comment do
    user
    post
    body { 'Great post!!' }

  end
end
