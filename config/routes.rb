Rails.application.routes.draw do 
  namespace :api do
    namespace :v1 do 
      resources :users, only: [:show, :create, :index, :delete]
      get '/', to: 'home#index'
      post 'auth/login', to: 'authentication#login'
      resources :transactions, only: [:show, :create, :index]
      resources :currencies, only: [:show, :create, :index, :delete]
    end
  end
  get '/', to: redirect('/404.html')

end
