Rails.application.routes.draw do
  scope "(:locale)" do
    get 'profile', action: :show, controller: 'users'
    get 'user/edit'
    get 'user/destroy'
    resources :items do
      resources :rents, only: %i[new create]
    end
    devise_for :users
    resources :rents, only: %i[index destroy]
    root 'items#index'
  end
end
