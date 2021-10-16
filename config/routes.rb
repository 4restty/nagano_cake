Rails.application.routes.draw do
  devise_for :customer, module: :public, only:[:registration, :session]
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }, skip: [:password, :registration]

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :items, only:[:index, :show]
    resource :customers, only:[:show, :edit, :update]
    post "customers/unsubscribe" => "customers#unsubscribe", as: "unsubscribe_customers"
    patch "customers/withdraw" => "customers#withdraw", as: "withdraw_customers"
    resources :addresses
    resources :orders
  end

  namespace :admin do
    root to: "/admin/homes#top"
    resources :genres
    resources :items
    resources :customers
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
end
