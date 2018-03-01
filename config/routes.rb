Rails.application.routes.draw do

  get 'fightings/new'

  get 'fightings/index'

  get 'fightings/show'

  resources :players
  root 'static_pages#home'

  get 'static_pages/home'

end
