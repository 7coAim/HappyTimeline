Rails.application.routes.draw do
  root to: 'users#top'

  resources :timelines do
    collection do
      post :confirm
    end
  end

  resources :users, only: %i[new create show]

  resources :sessions, only: %i[new create destroy]

  resources :messages, only: %i[create destroy]

  #mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
