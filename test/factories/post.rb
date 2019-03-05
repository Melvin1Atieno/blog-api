FactoryBot.define do
  factory :post do
    user
    title { 'first title' }
    text  { 'first text' }
    factory :post_with_comments do
      transient do
        comments_count { 2 }
      end
       
      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
      end
    end
  end
end