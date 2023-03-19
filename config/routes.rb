Rails.application.routes.draw do
  root to: 'projects#index'

  resources :projects, only: [:index, :show, :edit, :update] do
    resources :comments, only: [:new, :create]
  end
end
