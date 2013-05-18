RailsTest::Application.routes.draw do

  resources :homepages
  resources :events


  get "users/new"

  get "users/create"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get "new_event" => "events#new", :as => "new_event"
  get "event" => "events#show", :as => "event"
  get  "events" => "events#index", :as => "events"

  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "homepages" => "homepages#index", :as => "homepages"


root :to => "homepages#index"
#root is just your root url. It's saying go to the users pages and look for new

#get "/" => "static_pages#welcome"
#this is what you'll do for other roots beyond the root

  resources :users
  resources :sessions

post "create" => "static_pages#create" 

end
