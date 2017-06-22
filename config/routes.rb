Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  resources :blogs
  
 get '/pages/home', to: 'pages#home'
  
end
