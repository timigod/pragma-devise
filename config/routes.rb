Pragma::Devise::Engine.routes.draw do
  resources :confirmations, only: %i(create) do
    member do
      post :complete
    end
  end

  resources :recoveries, only: %i(create) do
    member do
      post :complete
    end
  end
end
