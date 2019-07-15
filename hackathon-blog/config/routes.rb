Rails.application.routes.draw do
  devise_for :users
  get 'blog/home'
  root to: 'blog#home'

  get "posts/new", to: "posts#new"
  post "posts", to: "posts#create"
  get "posts/show", to: "posts#show"

end
