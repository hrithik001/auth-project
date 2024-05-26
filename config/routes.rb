Rails.application.routes.draw do
  
  # root to: "main#index"
  root 'friends#index'
  resources :friends
  get "sign_up" ,to: "registrations#new"
  post "sign_up",to: "registrations#create"
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  get "sign_in" ,to: "sessions#new"
  post "sign_in",to: "sessions#create"
  delete "logout", to: "sessions#destroy"
 
end
