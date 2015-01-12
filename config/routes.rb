Rails.application.routes.draw do 

	root 'sessions#new'

	resources :users
  	get '/signup' => 'users#new'
  	get '/login'     => 'sessions#new'
	post '/login'    => 'sessions#create'
	delete '/logout' => 'sessions#destroy'

	resources :posts do
		resources :comments, only: :create
	end

	get '/upvote/:id' => 'posts#upvote', as: :upvote
 
end
