Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'top#main'
  
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  
  resources :likes
  #get 'like', 'likes/show' 
  #post 'likes', to: 'likes#create'
  #delete 'likes/:id', to: 'likes#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
