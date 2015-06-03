Voltex::Engine.routes.draw do
  resources :roles, only: [:edit, :update]
end
