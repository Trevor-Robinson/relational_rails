Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  #museums routes
  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  post '/museums', to: 'museums#create'
  get '/museums/:id', to: "museums#show"
  get '/museums/:id/edit', to: "museums#edit"
  patch '/museums/:id', to: 'museums#update'
  delete '/museums/:id', to:'museums#destroy'
end
