#Rails.application.routes.draw do
#  root 'tasks#index'
#  resources :tasks
#  resources :sessions, only: [:new, :create, :destroy]
#  resources :users, only: [:new, :create, :show, :edit, :update]
#  namespace :admin do
#    resources :users
#  end
#  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
#end

Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :users, except: %i(index, destroy)
  resources :sessions, only: %i(new create destroy)
  namespace :admin do
    resources :users
  end
  resources :labels, except: :show
end

