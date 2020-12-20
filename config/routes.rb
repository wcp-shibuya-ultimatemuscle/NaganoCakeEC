Rails.application.routes.draw do

  root to: 'customer/homes#top'
  get '/about', to: 'customer/homes#about'

  devise_for :customers, path: 'customer', controllers: {
  sessions:      'customer/sessions',
  passwords:     'customer/passwords',
  registrations: 'customer/registrations'
  }

  devise_for :admins, path: 'admin', controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }

  get 'orders/thanks' => 'customer/orders#thanks'
  post 'orders/confirm' => 'customer/orders#confirm'
  get "/customers/unsubscribe" => "customer/customers#unsubscribe"
  delete 'cart_items/:id' => 'customer/cart_items#destroy_all'
  patch "/customers/withdraw" => "customer/customers#withdraw"


  get 'admin/orders/top' => 'admin/orders#top'
  patch 'admin/order_creates/:id' => 'admin/order_creates#update'



  scope module: :customer do
    resources :products, only: [:index, :show,]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :create]
    resources :receivers, except:[:new, :show]
    resource :customers, only:[:show, :edit, :update], as: "customer"
  end

  namespace :admin do
   resources :orders, only: [:index, :show, :update]
   resources :genres, only: [:index, :update, :edit, :create]
   resources :products, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only:[:index, :edit, :update, :show]
  end

end

