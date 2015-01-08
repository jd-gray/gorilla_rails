Rails.application.routes.draw do 

	root 'welcome#index'

	resources :users, only: [:index, :create, :show]
  	get '/signup' => 'users#new'
  	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	resources :posts 
 
end
