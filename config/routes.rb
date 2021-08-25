Rails.application.routes.draw do
  
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
