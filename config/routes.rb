Rails.application.routes.draw do

  get 'fights/new'

  get 'fights/index'

  resources :players
  root 'static_pages#home'

  get 'static_pages/home'

end
