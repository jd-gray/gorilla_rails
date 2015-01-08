Rails.application.routes.draw do 

	resources :users, only: [:index, :create, :show]
  	get '/signup' => 'users#new'
  	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

  	resources :posts
  	root 'posts#index' 
 
end
