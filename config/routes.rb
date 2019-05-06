Rails.application.routes.draw do
  root to: "shingle#index"
  
    resources :shingle, only: %w(index)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
