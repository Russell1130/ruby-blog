Rails.application.routes.draw do
 
  resources :articles do
    resources :comments
  end
  
  get '/users/login', to: "users#login"
end
