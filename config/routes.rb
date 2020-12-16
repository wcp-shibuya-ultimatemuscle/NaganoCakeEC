Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #admins/orderのルーティング
  namespace :admin do
   resources :orders, only: [:index, :show, :update]
  end

  get 'admin/order/top' => 'admins/orders#top'

  #admins/genreのルーティング
  namespace :admin do
   resources :genres, only: [:index, :update, :edit, :create]
  end

  #admins/productのルーティング
  namespace :admin do
   resources :product, only: [:index, :new, :create, :show, :edit, :update]
  end

end

