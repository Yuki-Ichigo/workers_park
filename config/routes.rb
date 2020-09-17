Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get 'home/about', to: 'home#about'

  resources :users, only: [:show, :edit, :update, :hide, :destroy, :index] do
    member do
      get 'hide'
      put 'approval'
      put 'not_approval'
    end
  end
  resources :profiles, only: [:new, :create, :edit, :update, :index, :show]
  resources :companies, only: [:new, :create, :index, :show, :edit, :update] do
    resources :works, only: [:new, :create, :index, :show, :edit, :update] do
       member do
         put 'hide'
       end
    end
    member do
      put 'hide'
      put 'reopen'
      get 'information'
      patch 'info_up'
    end
  end

  resources :communicates, only: [:new, :create, :index, :show]
  resource :company_members, only: [:create, :destroy]
end
