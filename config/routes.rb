Rails.application.routes.draw do
  
  get '/shipping' => 'shipping#index'
  get '/finance' =>'finance#index'
  post '/approve/(:id)' => 'finance#approve_by_finance', as: :approve
  post '/err/(:id)' => 'finance#failure', as: :failure
  
  get    '/login' => 'login#new', as: :login
  post   '/login' => 'login#create'
  delete '/logout' => 'login#destroy', as: :logout
  
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
  root 'orders#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
