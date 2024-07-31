Rails.application.routes.draw do
  resources :agendas
  resources :clientes
  resources :servicos
  resources :descansos
  resources :itinerarios
  resources :prestadors
  resources :funcaos
  resources :empresas
  resources :enderecos
  resources :segmentos
  resources :tipo_empresas
end
