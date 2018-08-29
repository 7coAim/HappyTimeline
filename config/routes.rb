Rails.application.routes.draw do
  root to: 'users#top'

  resources :timelines, param: :url do
    collection do
      post :confirm
    end

    member do
      get :lock
      get :unlock
    end
  end

  resources :users, only: %i[new create show]

  resources :sessions, only: %i[new create destroy]

  resources :messages, only: %i[create edit update destroy]
end
