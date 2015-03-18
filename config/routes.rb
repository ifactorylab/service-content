Rails.application.routes.draw do
  get 'sites/:id', to: 'sites#show'
end
