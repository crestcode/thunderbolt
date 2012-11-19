CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :users, :only => [:create, :show]

  resources :posts, :only => [:index, :new, :create, :show] do
  
  	resources :comments, :only => [:create]
  	resources :votes, :only => [:create]

  	member do
  		get 'upvote', 'downvote'
  	end

  end

  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create' 
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
