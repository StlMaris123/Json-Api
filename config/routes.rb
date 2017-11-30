Rails.application.routes.draw do

 root 'welcome#index'

 resources :users do
   resources :questions do
     resources :answers
   end
 end
end
