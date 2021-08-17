Rails.application.routes.draw do
  
  resources :cotations
  shallow do
    resources :markets do
      resources :products do 
        resources :prices do
          resources :characteristics
        end
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
