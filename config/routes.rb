Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
  
  	namespace :v1 do
  		resources :homes
        resources :contacts
        resources :categories
    end
    end

 devise_for :users
  resources :homes
  resources :contacts
  resources :categories
  root  "homes#index"

end


