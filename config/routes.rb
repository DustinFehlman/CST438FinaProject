Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root to: 'home#index'
    post '/register', to: 'users#register'
    post   '/login', to: 'sessions#login'
    delete '/logout', to: 'sessions#logout'
    get '/getCurrentUser', to: 'sessions#getCurrentUser'
end
