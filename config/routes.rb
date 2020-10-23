Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles, only: %i[show update]
  resources :articles


  namespace :api, defaults: {format: :json} do
    resource :picture, only: %i[show]
    resources :likes, only: %i[index]
    scope '/articles/:article_id' do
      resource :like, only: %i[create destroy]
      resources :comments, only: %i[index create destroy]
    end
  end

  root to: 'articles#index'
end
