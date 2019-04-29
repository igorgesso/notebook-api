Rails.application.routes.draw do
  resources :kinds

  
  resources :contacts do
    resource :kind, only: [:show]
    resource :address, only: [:show, :update, :create, :destroy]
    resource :phones, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
