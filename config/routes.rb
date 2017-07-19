Rails.application.routes.draw do
  resources :url_mappers
  root 'url_mappers#index'
  get '/:id', to: 'url_mappers#take_me_to'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
