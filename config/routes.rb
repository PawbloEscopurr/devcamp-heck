Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  resources :blogs
  
 get '/pages/home', to: 'pages#home'
  
end
