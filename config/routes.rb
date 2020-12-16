Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins

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
