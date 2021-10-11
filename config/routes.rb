Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "/admin/homes#top"
    resources :genres
    resources :items
    resources :customers
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end
end
