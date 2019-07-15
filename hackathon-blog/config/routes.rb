Rails.application.routes.draw do
  devise_for :users
  get 'blog/home'
  root to: 'blog#home'

end
