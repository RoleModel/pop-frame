Rails.application.routes.draw do
  resources :weeks, only: %i[index show] do
    post :save, on: :collection
  end

  root 'weeks#index'
end
