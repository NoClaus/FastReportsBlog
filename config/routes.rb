Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  scope module: :web do
    root 'homepage#index'

    resources :articles, only: %i[index show]

    namespace :admin do
      root 'articles#index'
      resources :articles
    end

  end
end
