Rails.application.routes.draw do

  resources :rainbows, only:[:index,:show] do
    resources :user_comments

  end
  get '/myjj', to:'qqzfs#index'
  get '/collections', to:'rainbows#collections'
  get '/collection/:id', to:'rainbows#collection'
  get '/poison', to: 'rainbows#poison'
  get '/api/rainbow/random', to: 'rainbows#random'
  root 'rainbows#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
