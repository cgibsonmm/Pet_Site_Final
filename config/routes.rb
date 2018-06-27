Rails.application.routes.draw do
  get 'find_a_pet/index'

  devise_for :users, controllers: { registrations: 'registrations' }
  get 'home/index'

  get 'find_a_pet/index'

  root 'home#index'

  resources :users do
    resources :user_profile, shallow: true
    resources :animals, shallow: true do
      member do
        get 'crop'
      end
      resources :shot_records
    end
  end

  resources :photo_posts do
    resource :like, module: :photo_posts
    resources :comments
    member do
      get 'crop'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
