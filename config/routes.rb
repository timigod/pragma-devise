Pragma::Devise::Engine.routes.draw do
  resources :tokens, only: %i(create)

  resources :users, only: %i(create show)

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
