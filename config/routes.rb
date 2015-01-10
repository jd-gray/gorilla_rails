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

	get '/upvote/:id' => 'posts#upvote', as: :upvote
	get '/downvote/:id' => 'posts#downvote', as: :downvote
 
end
