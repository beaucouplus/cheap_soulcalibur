Rails.application.routes.draw do

  resources :fights
  post '/fights/:id/play/:player', to: 'fights#play', as: 'play'
  get '/fights/:id/play/:player', to: 'fights#play'
  resources :players
  root 'static_pages#home'

  get 'static_pages/home'

end
