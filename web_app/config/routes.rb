Rails.application.routes.draw do
  #root, root, root!
  root 'urls#new'

  #devise is the best!
  devise_for :users

  #URL builds
  resources :urls
  post 'urls/url_data' => 'urls#url_data' #used for ajax build url

  #Bookmarks are the key!
  resources :bookmarks

  #Groups make up the folder system
  post 'group/:id/access' => 'groups#access'
  resources :groups


  #api protocol for chome extension
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      resources :bookmarks, only: :create
      resources :groups
      resources :sessions, only: :create
    end
  end

end
