Rails.application.routes.draw do
  root to: 'marketing#index'

  resource :dashboard, only: [:show]

  resources :customers, only: [:new, :create]
  resources :volunteers, only: [:new, :create]

  resources :errands, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    get 'search', on: :collection

    resources :offers, only: [:new, :create]
  end

  resources :offers, only: [:index, :show, :destroy] do
    resources :acceptances, only: [:create]
  end

  namespace :admin do
    resources :users, except: [:new, :destroy]
  end

  # Authentication
  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, controller: "users", only: [:create] do
    resource :password,
             controller: "passwords",
             only: [:create, :edit, :update]
  end
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

  # Top-level static pages
  get "/*id" => 'pages#show',
      as: :page,
      format: false,
      constraints: { id: /(#{HighVoltage.page_ids.join('|')})/ }
end
