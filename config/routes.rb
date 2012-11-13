CourseProject::Application.routes.draw do
  root to: "posts#index"

  resources :posts, :only => [:index, :new, :create, :show] do
  
  	resources :comments, :only => [:create]
  	resources :votes, :only => [:create]

  	member do
  		get 'upvote', 'downvote'
  	end

  end
end
