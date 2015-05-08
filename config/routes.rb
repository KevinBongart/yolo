Rails.application.routes.draw do
  resources :messages, only: [:create] do
    post :reply
  end
end
