Rails.application.routes.draw do
  resources :characteristics
  resources :markets do
    resources :products do 
      resources :prices
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
