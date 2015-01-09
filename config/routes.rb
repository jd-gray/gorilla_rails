Rails.application.routes.draw do 

	root 'welcome#index'

	resources :users
  	get '/signup' => 'users#new'
  	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	resources :posts do
		resources :comments, only: :create
	end 
 
end
