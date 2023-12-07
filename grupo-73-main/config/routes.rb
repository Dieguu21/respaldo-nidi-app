# frozen_string_literal: true

Rails.application.routes.draw do
  # Setup devise creación controller y enrutamiento (inicio).
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # Setup devise creación controller y enrutamiento (fin).
  get 'users/:id', to: 'users#show', as: 'users'

  # Turns (Turnos/Publicaciones)
  root 'turns#all'
  get '/turns/index', to: 'turns#index' # '/turns/index'-> Mis publicaciones (como chofer)
  get '/turns/all', to: 'turns#all'     # '/turns/all'-> Turnos (como pasajero)
  resources :turns, except: [:index] # '/turns'-> Page Not Found

  # Requests (Solicitudes)
  # get 'requests/new', to: 'requests#new', as: :new_request
  get 'requests/new/:id', to: 'requests#new', as: :new_request
  # post 'requests', to: 'requests#create', as: 'requests'
  post 'requests/:id', to: 'requests#create', as: 'requests'

  get '/requests', to: 'requests#index', as: 'requests_index'
  get 'requests/:id', to: 'requests#show', as: 'requests_show'

  get 'requests/:id/edit', to: 'requests#edit', as: 'requests_edit'
  patch 'requests/:id', to: 'requests#update', as: 'requests_update'

  delete 'requests/:id', to: 'requests#delete', as: 'requests_delete'

  get 'solicitudes', to: 'requests#pestana_solicitudes'
  # #este arbia que cambiarle el id creo
  get 'solicitudes/:id', to: 'requests#detalles_solicitud', as: 'requests_detalle'
  get 'solicitudes/rechazar/:id', to: 'requests#rechazar_solicitud', as: 'requests_rechazar'
  get 'solicitudes/aceptar/:id', to: 'requests#aceptar_solicitud', as: 'requests_aceptar'

  # Ratings (Reseñas)
  get '/resenas', to: 'ratings#index', as: :ratings
  get 'resenas/new/:id', to: 'ratings#new', as: :new_rating
  post '/resenas', to: 'ratings#create', as: :create_rating

  get 'resenas/:id', to: 'ratings#show', as: 'ratings_show'

  get 'resenas/:id/edit', to: 'ratings#edit', as: 'ratings_edit'
  patch 'resenas/:id', to: 'ratings#update', as: 'ratings_update'

  delete 'resenas/:id', to: 'ratings#destroy', as: 'ratings_delete'

  # Chats (Chats xd)
  get 'chats/:id', to: 'chats#new', as: 'chats_new'
  post 'chats/:id', to: 'chats#create', as: 'chats_create'
  get '/chats', to: 'chats#index', as: 'chats_index'
end
