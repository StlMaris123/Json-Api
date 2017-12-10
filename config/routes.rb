Rails.application.routes.draw do

  root 'welcome#index'

  resources :users 
  resources :questions do
    resources :answers
  end

  post 'auth/login', to: 'authentication#authenticate'
end
