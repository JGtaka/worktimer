Rails.application.routes.draw do
  devise_for :users

  root "top#index"

  get "/tasks", to: "tasks#index"
  get "/tasks/new", to: "tasks#new"
  post "/tasks", to: "tasks#create"
  get "/tasks/:id", to: "tasks#show"
  get "tasks/:id/edit", to: "tasks#edit", as: "edit_task"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
