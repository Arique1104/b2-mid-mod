Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :surgeries, only: [:index, :show]
  post "/surgeries/:id/add_doctor", to: 'doctor_surgeries#create'
end
