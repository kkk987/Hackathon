Rails.application.routes.draw do
  devise_for :users
  get 'blog/home'
  root to: 'blog#home'

  get "posts/new", to: "posts#new"
  post "posts", to: "posts#create"
  get "posts/show", to: "posts#show"
  post "comment", to: "comments#create", as: "comments"
  get "comment/:id/edit", to: "comments#edit", as: "edit_comment"
  patch "comment/:id", to: "comments#update", as: "comment"
  delete "comment/:id", to: "comments#destroy", as: "delete_comment"
  get "posts/:id", to: "posts#display", as: "post"
  get "posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "posts/:id", to: "posts#update", as: "update_post"
  delete "posts/:id", to: "posts#destroy", as: "delete_post"
end
