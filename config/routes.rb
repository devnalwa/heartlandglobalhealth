Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/about', to: 'static_pages#about'
    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'
    get '/members', to: 'users#members'
    get '/info', to: 'static_pages#conference_info'
    get '/users', to: 'users#show'
    post '/edit', to: 'users#edit'
    get '/profile', to: 'users#profile'
    
    devise_for :users, :controllers => { :registrations => "users/registrations" }
    root 'static_pages#home'
    resources :users
    resources :posts
    resources :charges
  end
end
