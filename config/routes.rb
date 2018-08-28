Rails.application.routes.draw do
  get 'rent/index'
  get 'rent/new'
  get 'rent/create'
  get 'rent/destroy'
  scope "(:locale)" do
    resources :items
    devise_for :users
    root 'items#index'
  end
end
