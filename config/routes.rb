Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'home/about', to: 'home#about'

  resources :users, only: [:show, :edit, :update, :hide, :destroy, :index] do
      collection do
        get 'hide'
        put 'authorization'
      end
  end

  resources :profiles, only: [:new, :create, :edit, :update, :index, :show]
end
