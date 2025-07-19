Rails.application.routes.draw do
  get 'task_shares/create'
  get 'task_shares/destroy'
  get 'tasks/shared'
  devise_for :users

  resources :tasks do
    resources :task_shares, only: [:create]
  end

  resources :notifications, only: [:index]
  
  root "top#index"

  if Rails.env.developent?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
