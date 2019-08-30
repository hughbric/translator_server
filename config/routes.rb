Rails.application.routes.draw do
  root 'terms#index'
  resources :terms
end
