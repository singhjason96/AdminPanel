Rails.application.routes.draw do
  # get 'courses/edit'
  # get 'courses/show'
  # get 'courses/new'
  # get 'courses/index'
  # get 'cohorts/edit'
  # get 'cohorts/show'
  # get 'cohorts/new'
  # get 'cohorts/index'
  resources :users, only: [:index, :new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :delete]
  resources :cohorts, only: [:index, :new, :create, :show, :edit] do
    resources :courses, only: [:index, :new, :show, :edit]
    

  end
  # get 'users/edit'
  # get 'users/show'
  # get 'users/new'
  # get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
