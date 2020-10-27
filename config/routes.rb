require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  scope '/users/:user_id' do
    resource :profile, only: %i[show update]
    resource :following, only: %i[show]
    resource :follower, only: %i[show]
  end
  
  resources :articles, only: %i[new create index] do
    resources :comments, only: %i[index create destroy]
  end

  namespace :api, defaults: {format: :json} do
    resource :picture, only: %i[show]
    resources :likes, only: %i[index]
    scope '/articles/:article_id' do
      resource :like, only: %i[create destroy]
    end
    scope '/users/:user_id/profile/' do
      resource :relationship, only: %i[create destroy]
    end
  end

  root to: 'articles#index'
end
