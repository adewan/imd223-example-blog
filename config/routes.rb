Myblog::Application.routes.draw do

  devise_for :users

  root :to => "home#index"

  resources :posts do
    resources :tags, :except => [:index, :new, :show, :edit]
    resources :comments
  end

  resources :tags, :only => [:show]

  resources :comments
end