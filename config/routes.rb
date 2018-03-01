Rails.application.routes.draw do

  resources :fights

  resources :players
  root 'static_pages#home'

  get 'static_pages/home'

end
