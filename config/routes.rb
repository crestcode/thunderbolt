CourseProject::Application.routes.draw do
  root to: "posts#index"
  resources :posts, :only => [:index, :new, :create, :show] do
  	resources :comments, :only => [:create]
  end
end
