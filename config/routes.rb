Rails.application.routes.draw do
  resources :markets do
    resources :products
  end

  #resources :products

  shallow do
    resources :markets do
      resources :products do 
        resources :characteristics
        resources :prices do
          resources :cotations
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
