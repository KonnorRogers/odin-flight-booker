Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  root 'flights#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: %i[index create]
end
