Rails.application.routes.draw do
  root to: "sessions#new"
  get "/logout", to: "sessions#destroy", as: :logout
 
  resources :users, only: [:index, :new, :create, :show, :edit, :destroy] 
  resources :sessions, only: [:new, :create, :destroy]
  resources :students, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :instructors, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :cohorts, only: [:index, :new, :create, :show, :edit] do
    resources :courses, only: [:index, :new, :show, :edit]
    
    

  end
  
end
