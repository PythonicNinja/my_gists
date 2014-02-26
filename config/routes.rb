MyGists::Application.routes.draw do

  resources :gists
  root 'gists#index'

end
