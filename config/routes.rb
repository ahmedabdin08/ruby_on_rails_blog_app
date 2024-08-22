# config/routes.rb

require "sidekiq/web"

Rails.application.routes.draw do
  # Mount Sidekiq's Web UI at /sidekiq
  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  resources :posts do
    resources :comments, only: [ :create, :edit, :update, :destroy ]
  end

  # Health check routes (if required)
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes (if required)
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Set the root path to posts index
  root "posts#index"
end
