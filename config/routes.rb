Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/login" => "log_in#login"
  post "/login" => "log_in#post_login"
  delete "/logout" => "log_in#logout"

  resources :users

  get 'admin/:id' => 'users#admin', as: "admin"
  post 'admin/:id' => 'users#post_admin', as: "post_admin"



end
