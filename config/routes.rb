Rails.application.routes.draw do
  scope "(:locale)" do
    resources :items
    get 'profile', action: :show, controller: 'users'
    get 'user/edit'
    get 'user/destroy'
    resources :items
    devise_for :users
    resources :rent, only: %i[index new create destroy]
    root 'items#index'
  end
end
