Rails.application.routes.draw do
  ##管理者用
  #URL /admin/sign_in...
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #URL /admin...
  namespace :admin do
    get "/" => "homes#top"
    resources :items
    resources :genres, only: [:index, :create, :edit, :update, :show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  ##顧客用
  #URL /customers/sign_in...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    root to: 'homes#top'
    get "about" => "homes#about"
    resources :items, only: [:index, :show]

    #customersコントローラ
    get "customers/my_page" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    patch "customers/infoemation" => "customers#update"
    get "customers/unsubscribe" => "customers#unsubscribe" #退会確認画面
    patch "customers/withdraw" => "customers#withdraw" #論理削除用

    #cart_itemsコントローラ
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :create, :destroy]

    #ordersコントローラ
    get "orders/complete" => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show, :destroy] ##destroyはtest削除のためなので後で消す！！！
    post "orders/confirm" => "orders#confirm"

    #addressesコントローラ
    resources :addresses, except: [:new, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
