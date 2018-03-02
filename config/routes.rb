Rails.application.routes.draw do

  resources :fights
  post '/fights/:id/hit/:player', to: 'fights#hit', as: 'hit'
  get '/fights/:id/hit/:player', to: 'fights#hit'
  resources :players
  root 'static_pages#home'

  get 'static_pages/home'

end
