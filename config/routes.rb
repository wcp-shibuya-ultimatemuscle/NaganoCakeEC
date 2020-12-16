Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'customer/sessions',
  passwords:     'customer/passwords',
  registrations: 'customer/registrations'
  }

  devise_for :admins, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
  }
  
  patch 'admin/order_creates/:id' => 'admin/order_creates#update'

  get 'orders/thanks' => 'customer/orders#thanks'
  post 'orders/confirm' => 'customer/orders#confirm'

  scope module: :customer do
    resources :products, only: [:index, :show,]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:index, :show, :new, :create]
  end
  delete 'cart_items/:id' => 'customer/cart_items#destroy_all'

  #admins/orderのルーティング
  namespace :admin do
   resources :orders, only: [:index, :show, :update]
  end

  get 'admin/order/top' => 'admin/orders#top'

  #admins/genreのルーティング
  namespace :admin do
   resources :genres, only: [:index, :update, :edit, :create]
  end

  #admins/productのルーティング
  namespace :admin do
   resources :products, only: [:index, :new, :create, :show, :edit, :update]
  end

  root to: 'customer/homes#top'
  get '/about', to: 'customer/homes#about'

  namespace :admin do                                                  #admin/customersコントローラのルーティングです　5-7行
    resources :customers, only:[:index, :edit, :update, :show]
  end

  scope module: :customer do                                          #customer/receiversコントローラのルーティングです　9-11行
    resources :receivers, except:[:new, :show]
  end

  scope module: :customer do                                          #customer/customersコントローラのルーティングです  13-18行
    resource :customers, only:[:show, :edit, :update]                 #showとeditのURLに:idを含ませないためresourceを単数形にしています
  end

  get "/customers/unsubscribe" => "customer/customers#unsubscribe"    #getメソッドでunsubscribeアクションにつながります
  patch "/customers" => "customer/customers#withdraw"                 #patchメソッドでwithdrawアクションにつながります

end

