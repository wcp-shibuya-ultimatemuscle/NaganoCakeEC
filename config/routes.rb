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
  
  devise_for :customers
  devise_for :admins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

