Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  patch 'admin/order_creates/:id' => 'admin/order_creates#update'

  get 'orders/thanks' => 'customer/orders#thanks'
  post 'orders/confirm' => 'customer/orders#confirm'

  scope module: :customer do
    resources :products, only: [:index, :show,]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :create]
  end
  delete 'cart_items/:id' => 'customer/cart_items#destroy_all'

end
