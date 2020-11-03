Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  get "users/create"
  get "users/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session
end
