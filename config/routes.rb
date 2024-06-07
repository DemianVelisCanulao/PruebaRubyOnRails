Rails.application.routes.draw do
  devise_for :users
  resources :project do 
    resources :task
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  post '/project/create', to: 'project#create', as: 'create_project'
  # Defines the root path route ("/")
  # root "posts#index"
  root 'project#index'
end
