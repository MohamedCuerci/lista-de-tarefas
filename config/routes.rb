Rails.application.routes.draw do
  root "items#index"
  resources :items
  
  get 'welcome/index'
end
