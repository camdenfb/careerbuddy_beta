Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'login', to: 'home#login', as: 'login'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/show'
  
  
  get "/career_dashboard/:id", to: "user_careers#career_dashboard", as: 'career_dashboard'
  get "/templates/new", to: "activities#new_template", as: 'create_template'
  get "/templates/:id/edit", to: "activities#duplicate_template", as: 'duplicate_template'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :skills
  resources :careers
  resources :settings
  resources :user_careers
  resources :user_jobs
  resources :settings
  resources :activities
  resources :user_skills
end
