RailsTest::Application.routes.draw do

  get "users/new"

  get "users/create"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"

root :to => "users#new"
#root is just your root url. It's saying go to the static_pages and look for welcome

#get "/" => "static_pages#welcome"
#this is what you'll do for other roots beyond the root

  resources :users
  resources :sessions

post "create" => "static_pages#create"

end
