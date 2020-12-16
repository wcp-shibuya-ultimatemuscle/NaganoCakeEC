Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
   resources :orders, only: [:index, :show, :update]
  end

  get 'admin/orders/top' => 'admins#top'

  namespace :admin do
   resources :genres, only: [:index, :update, :edit, :create]
  end

  namespace :admin do
   resources :product, only: [:index, :new, :create, :show, :edit, :update]
  end

end

