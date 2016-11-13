Rails.application.routes.draw do
  resources :users, only: [:show, :create, :update, :destroy]
  get '/trains', to: 'trains#index'
  get '/trains/:id', to: 'trains#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
