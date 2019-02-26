Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do |users|
        resources :posts, :name_prefix => "user_"
      end
      resources :users do |users|
        resources :comments, :name_prefix => "user_"
      end

      resources :posts do |posts|
        resources :comments, :name_prefix => "post_"
      end

      resources :comments
    end
  end
end
