Rails.application.routes.draw do
  devise_for :users
  root 'players#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :clubs
  resource :users
  resources :hello_app
  namespace :admin do
    resources :update_matches
    resources :clubs do
      collection do
        resources :update_players, controller: 'clubs/update_players'
      end
    end
  end
end
