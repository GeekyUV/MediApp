Rails.application.routes.draw do
  namespace :doctors do
    resources :patients, only: [:index]
    get 'registration_graph', to: 'patients#registration_graph'
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :patients
  root 'pages#home'
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end

