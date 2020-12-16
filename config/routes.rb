Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  patch 'admin/order_creates/:id' => 'order_create#show'

  scope module: :customer do
    resources :orders, only: [:thanks, :index, :show, :new, :create, :confilm]
  end

  scope module: :customer do
    resources :products, only: [:index, :show,] do
      resources :cart_items, only: [:create, :index, :update, :destroy, :destroy_all]
    end
  end

end
