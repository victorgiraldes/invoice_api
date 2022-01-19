Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :users do
    post '/registrations', to: 'users#create'
    get '/verify_token', to: 'users#verify_token'
  end

  scope :auth do
    delete '/', to: 'auth#destroy'
  end
  resources :invoices
end
