FactoryBot.define do
  factory :user do
    username { 'John' }
    full_name  { 'Doe' }
    password { 'password' }

    factory :user_with_posts do
      transient do
        posts_count { 3 }
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end
