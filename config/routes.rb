Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :owners do
    resources :campers 
  end
  
  resources :owners, only: [] do  
    resources :cars 
  end

  resources :campers, only: [] do
    resources :campgalleries, except: [:destroy]
 end

  resources :cars, only: [] do
    resources :cargalleries, except: [:destroy]
  end

   
  get    "/login"  =>  "log_in#login"
  post   "/login"  =>  "log_in#post_login"
  delete "/logout" =>  "log_in#logout"
  get "/auth/google_oauth2/callback", to: "log_in#google_login"
  
  resources :users, except: [:index, :destroy]

end
