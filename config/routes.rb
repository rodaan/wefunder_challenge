Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # resources :users
  #   resources :tournaments
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'test', to: 'welcome#testemail'
  post 'cool', to: 'welcome#testingemail'
  # get 'tournaments/new', to: 'tournaments#new', as: 'tournaments'
  # post 'tournaments', to: 'tournaments#create'
  # get 'tournaments/players', to: 'players#index', as: 'players'
  # get 'tournaments/players/new', to: 'players#new'
  # post 'tournaments/players', to: 'players#create'
  resources :tournaments do
    resources :players, only: [:index, :show,:create, :update, :new]
  end
  resources :players
end
