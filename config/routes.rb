Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do 
    get '/signup', to: 'devise/registrations#new', as: :signup
    get '/signin', to: 'devise/sessions#new', as: :signin
  end
 
  resources :user_friendships do 
    member do 
      put :accept
      put :block
    end
  end

  resources :posts
  get 'feed', to: 'posts#index', as: :feed
  root 'posts#index'

  scope ":user_id" do 
    resources :albums do 
      resources :pictures
    end
  end

  get ':id' => 'profiles#show', as: 'profile'

end
