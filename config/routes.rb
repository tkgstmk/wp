Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  resources :homes, only: [:index, :show]
  resources :projects, only: [:index, :create, :show, :edit, :update, :destroy]
  get '/users/goal' => 'users#goal', as: 'goal'
  resources :users, only: [:update, :show, :edit]
  # get '/projects/all' => 'projects#all'
  # get '/projects/one/:id' => 'projects#one'
end
