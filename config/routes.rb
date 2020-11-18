Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :owners do
    resources :campers do
       resources :campgalleries
    end
  end
  resources :owners do  
    resources :cars do
      resources :cargalleries
    end
  end
   
  get    "/login"  =>  "log_in#login"
  post   "/login"  =>  "log_in#post_login"
  delete "/logout" =>  "log_in#logout"
  
  
  resources :users


end
