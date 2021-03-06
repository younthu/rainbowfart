Rails.application.routes.draw do

  resources :rainbows, only:[:index,:show] do
    resources :user_comments

  end
  get '/rainbow', to: 'rainbows#index'
  get '/myjj', to:'qqzfs#index'
  get '/yijuzi', to: 'yijuzis#index'
  get '/collections', to:'rainbows#collections'
  get '/collection/:id', to:'rainbows#collection'
  get '/poison', to: 'rainbows#poison'
  get '/api/rainbow/random', to: 'rainbows#random'
  get '/search', to: "rainbows#index"
  root 'rainbows#report'
  get 'report', to: 'rainbows#report'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
