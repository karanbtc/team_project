Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions',  registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   get "/login" => "devise/sessions#new"
  #   get "/register" => "devise/registrations#new"

  #   authenticated :user do
  #     root 'teams#index'
  #   end

  #   unauthenticated :user do
  #     root 'devise/sessions#new'
  #   end
  # end
  # devise_scope :user do
  #   get "signup", to: "devise/registrations#new"
  #   get "login", to: "devise/sessions#new"
  #   get "logout", to: "devise/sessions#destroy"
  # end
  get "/shifts" => "teams#shift"
  get "/find_users" => "teams#shift_wise_user"
  put "/update" => "teams#update_shift"
  resources :teams, except: [:show]

  root to: 'teams#index'

end