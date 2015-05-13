Rails.application.routes.draw do
  get 'sites/:id', to: 'sites#show'

  post 'sites/:site_id/pages', to: 'pages#create'
  get 'sites/:site_id/pages', to: 'pages#index'
  get 'pages/:id', to: 'pages#show'
  patch 'pages/:id', to: 'pages#update'
  put 'pages/:id/background', to: 'pages#upload'

  get 'pages/:page_id/contents', to: 'contents#index'
  patch 'contents/:id', to: 'contents#update'
  put 'contents/:id/image', to: 'contents#upload'

end
