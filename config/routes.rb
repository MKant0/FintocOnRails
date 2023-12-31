Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users do
    resources :accounts
    resources :links, only: [:index, :create]
    resources :movements
  end

  resources :link_intents, only: [:new, :create, :show]
  resources :payments, only: [:create]
  resources :institutions, only: [:index, :show]
  resources :account_balances, only: [:index, :show]
  resources :exchange_tokens, only: [:create, :index]

end
