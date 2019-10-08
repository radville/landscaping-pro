Rails.application.routes.draw do
  root to: "application#index"
  
  devise_for :landscapers, controllers: {
  }
  resources :landscapers, only: [:index, :show]

  devise_for :users, controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # resources :users, only: [:index, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
