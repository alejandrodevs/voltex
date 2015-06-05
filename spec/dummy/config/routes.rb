Rails.application.routes.draw do
  resources :roles
  mount Voltex::Engine => '/voltex'
end
