CourseProject::Application.routes.draw do
  root to: "main#index"
  resources :main, :posts
end
