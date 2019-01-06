Rails.application.routes.draw do
  root to: "sessions#new"
  get "/logout", to: "sessions#destroy", as: :logout
 
  resources :users, only: [:index, :new, :create, :show, :edit] 
  resources :sessions, only: [:new, :create, :destroy]
  resources :cohorts, only: [:index, :new, :create, :show, :edit] do
    resources :courses, only: [:index, :new, :show, :edit]
    

  end
  
end
