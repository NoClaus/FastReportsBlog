Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope module: :web do
    root 'articles#index'

    resources :articles, only: %i[index show]

  end
end
