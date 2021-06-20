Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post :login, to: 'users#login'

  resources :posts do
    resources :ratings

    collection do
      get :top
      get :ip_listing
    end
  end
end
