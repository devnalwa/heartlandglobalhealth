Rails.application.routes.draw do
  resources :consortia
  resources :articles
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/about', to: 'static_pages#about'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/members', to: 'users#members'
    get '/info', to: 'static_pages#conference_info'
    get '/users', to: 'users#show'
    get '/profile', to: 'users#profile'
    get '/consortium', to: 'consortium#index'

    devise_for :users, :controllers => { :registrations => "users/registrations" }
    root 'static_pages#home'
    resources :users
    resources :posts
    resources :charges
  end
end
