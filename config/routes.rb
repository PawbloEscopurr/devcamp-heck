Rails.application.routes.draw do
  resources :blogs
  
 get '/pages/home', to: 'pages#home'
  
end
