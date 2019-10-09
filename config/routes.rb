Rails.application.routes.draw do
  root to: "application#index"
  
  devise_for :landscapers, controllers: {
    registrations:      "landscapers/registrations",
    sessions:           "landscapers/sessions",
    # passwords:          "landscapers/passwords",
    # confirmations:      "landscapers/confirmations",
  }
  resources :landscapers, only: [:index, :show]

  devise_for :users, controllers: {
    sessions:           "users/sessions",
    registrations:      "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
    # confirmations:      "users/confirmations",
    # passwords:          "users/passwords",
  }
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
