Rails.application.routes.draw do
  devise_for :users
  get 'blog/home'
  root to: 'blog#home'

  get "posts/new", to: "posts#new"
  post "posts", to: "posts#create"
  get "posts/show", to: "posts#show"
  get "posts/:id", to: "posts#display", as: "post"
  get "posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "posts/:id", to: "posts#update", as: "update_post"
  delete "posts/:id", to: "posts#destroy", as: "delete_post"
end
