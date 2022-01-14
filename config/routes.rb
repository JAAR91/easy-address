Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/new-user', to: "users#create"
      post '/login', to: "users#login"
      get '/address', to: "addresses#index"
      post '/address/new', to: "addresses#create"
      delete '/address/delete/:id', to: "addresses#delete"
      patch '/address/update/:id', to: "addresses#update"
    end
  end

  get '*page', to: 'static#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end
end