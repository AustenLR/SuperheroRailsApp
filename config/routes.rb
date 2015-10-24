Rails.application.routes.draw do
  get 'teams/index'

  get 'teams/new'

  get 'teams/edit'

  get 'teams/show'

  get 'teams/_form'

  get 'superheros/index'

  get 'superheros/show'

  get 'superheros/edit'

  get 'superheros/new'

  get 'superheros/_form'

  root 'users#login'
  get 'login', to: "users#login", as: 'login'

  get 'signup', to: "users#signup", as: 'signup'

  post 'login', to: "users#attempt_login"

  post 'signup', to: "users#create"

  get 'home', to: "users#home", as: 'home'

  delete 'logout', to: "users#logout"

  resources :teams
  resources :superheros
end
