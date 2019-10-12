Rails.application.routes.draw do
  root to: "application#index"
  
  devise_for :landscapers, controllers: {
    registrations:      "landscapers/registrations",
    sessions:           "landscapers/sessions",
    # passwords:          "landscapers/passwords",
    # confirmations:      "landscapers/confirmations",
  }
  resources :landscapers, only: [:index] do
     #nested resource for appointments
     resources :appointments, only: [:new, :create, :index, :show, :destroy]
  end

  get 'landscapers/service' => "landscapers#index"
  post 'landscapers/service' => "landscapers#index"
  get 'landscapers/sort' => "landscapers#index"
  post 'landscapers/sort' => "landscapers#index"

  devise_for :users, controllers: {
    sessions:           "users/sessions",
    registrations:      "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
    # confirmations:      "users/confirmations",
    # passwords:          "users/passwords",
  }
  resources :users, only: [:show] do
    #nested resource for appointments
    resources :appointments, only: [:index, :show, :destroy]
  end

  resources :appointments, only: [:new, :create, :index, :show, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
