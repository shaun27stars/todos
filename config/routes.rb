Rails.application.routes.draw do
  namespace :admin do
      resources :todos

      root to: "todos#index"
    end
  root to: 'todos#index'

  resources :todos, only: %i[index new create] do
    resource :completion, only: %i[create destroy]
  end
  resource :session, only: %i[new create]
end
