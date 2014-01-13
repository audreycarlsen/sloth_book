SlothBook::Application.routes.draw do

  root 'sessions#new'

  get 'log_in'   => 'sessions#new',     :as => 'log_in'
  get 'log_out'  => 'sessions#destroy', :as => 'log_out'
  get 'newsfeed' => 'users#newsfeed',   :as => 'newsfeed'
  get 'dashboard' => 'dashboard#index', :as => 'dashboard'

  resources :friendships
  resources :posts
  resources :sessions
  resources :users do
    collection do
      get 'search'
    end
  end

end
