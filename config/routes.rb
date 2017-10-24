Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/members', to: 'users#members'
  get '/info', to: 'static_pages#conference_info'
  resources :users
end
