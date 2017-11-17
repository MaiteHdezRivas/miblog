Rails.application.routes.draw do
  devise_for :autors
  root to: "home#index"
  #get 'articulos/new'
  #get 'articulos/index'

  resources :articulos

  get 'estaticas/home'
  get 'estaticas/index'

  get 'home/index'

  
  # For details on rathe DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
