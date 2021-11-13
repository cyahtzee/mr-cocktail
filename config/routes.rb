Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :new, :show, :create] do
    collection do
      get "alcoholic"
    end

    collection do
      get "virgin"
    end
    resources :dose, only: [:new, :create]
  end
  resources :dose, only: [:destroy]
end
