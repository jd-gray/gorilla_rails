Rails.application.routes.draw do 

	resources :users, only: [:index, :create]
  	get '/signup' => 'users#new'

  	resources :posts
  	root 'posts#index' 
 
end
