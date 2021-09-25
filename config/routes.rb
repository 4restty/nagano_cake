Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :genres
  end
end
