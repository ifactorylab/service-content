Rails.application.routes.draw do
  get 'sites/:id', to: 'sites#show'

  post 'sites/:site_id/pages', to: 'pages#create'
  get 'sites/:site_id/pages', to: 'pages#index'
  get 'pages/:id', to: 'pages#show'
  patch 'pages/:id', to: 'pages#update'
end
