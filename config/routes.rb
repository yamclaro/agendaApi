# config/routes.rb

Rails.application.routes.draw do
  get '/empresas', to: 'empresas#index', as: 'empresas'
  get '/empresas/:id', to: 'empresas#show', as: 'empresa'
  post '/empresas', to: 'empresas#create'
  patch '/empresas/:id', to: 'empresas#update'
  delete '/empresas/:id', to: 'empresas#destroy'
end
