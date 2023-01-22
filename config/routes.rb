Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope module: :web do
    root 'homepage#index'

    resources :articles, only: %i[index show]

    namespace :admin do
      resources :articles
    end

  end
end
