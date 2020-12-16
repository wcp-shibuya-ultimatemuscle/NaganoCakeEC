Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

  root to: 'customer/homes#top'
  get '/about', to: 'customer/homes#about'

end
