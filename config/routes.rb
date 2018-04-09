Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'home/index'

  root 'home#index'

  resources :users do
    resources :user_profile, shallow: true
  end

  resources :photo_posts do
    resources :comments
    member do
      get 'crop'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
