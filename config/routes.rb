Rails.application.routes.draw do
  root to: 'stores#index'
  resources :stores, only: [ :index, :shows, :new, :create, :edit, :update ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
