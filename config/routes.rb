Rails.application.routes.draw do
  get 'bookings_controller/new'
  get 'bookings_controller/create'
  get 'bookings_controller/show'
  root 'flights#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: %i[index create]
end
