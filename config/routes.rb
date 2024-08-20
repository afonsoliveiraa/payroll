Rails.application.routes.draw do
  resources :insses
  resources :employees do
    resources :notes
    resources :financials
  end
  resources :events
  resources :competences
  resources :roles
  resources :departments do
    resources :sectors, except: [:index, :show]
  end
  resources :situations
  resources :natures
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
