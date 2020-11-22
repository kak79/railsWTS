# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :owners do
    resources :campers
  end

  resources :owners, only: [] do
    resources :cars
  end

  get    '/login'  =>  'log_in#login'
  post   '/login'  =>  'log_in#post_login'
  delete '/logout' =>  'log_in#logout'
  get '/auth/google_oauth2/callback', to: 'log_in#google_log'

  resources :users, except: %I[index destroy]
  get     '/users/:id/edit_p'  =>  'users#edit_p'        , as: 'edit_password'
  patch   '/users/:id'         =>  'users#update_p'  
end
