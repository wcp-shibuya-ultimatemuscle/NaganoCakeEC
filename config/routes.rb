Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  patch 'admin/order_creates/:id' => 'order_create#show'

  scope module: :customer do
    resources :orders, only: [:index, :show, :new, :create]
  end
  get 'orders/thanks' => 'orders#thanks'
  post 'orders/confirm' => 'orders#confirm'

  scope module: :customer do
    resources :products, only: [:index, :show,]
    resources :cart_items, only: [:create, :index, :update, :destroy]
  end
  delete 'cart_items/:id' => 'cart_items#destroy_all'

end
