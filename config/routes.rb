Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users 
      resources :posts do
        resources :comments, only: :destroy
      end
    end
  end
end
