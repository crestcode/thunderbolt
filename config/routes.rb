CourseProject::Application.routes.draw do
  root to: "posts#index"
# match "upvote" => "posts#upvote"
  resources :posts, :only => [:index, :new, :create, :show] do
  
  	resources :comments, :only => [:create]
 
  	member do
  		get 'upvote', 'downvote'
  	end

  end
end
