Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#main'
  resources :cocktails, only: [:index, :new, :show, :create] do
    collection do
      get "alcoholic"
    end

    collection do
      get "virgin"
    end

    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
