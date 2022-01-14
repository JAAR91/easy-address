Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/new-user', to: "users#create"
      post '/login', to: "users#login"
      get '/home', to: "cars#index"
      post '/new-car', to: "cars#create"
      get '/cars-and-cities', to: "reservations#index"
      post '/reservations/new', to: "reservations#create"
      delete '/reservations/:id', to: "reservations#delete"
      delete '/cars/:id', to: "cars#destroy"
    end
  end

  get '*page', to: 'static#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end

  root 'static#index'
end
