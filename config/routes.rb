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

  # works_of_art routes
  get '/works_of_art', to: 'works_of_art#index'
  get '/works_of_art/new', to: 'works_of_art#new'
  post '/works_of_art', to: 'works_of_art#create'
  get 'works_of_art/:id', to: 'works_of_art#show'
  get '/works_of_art/:id/edit', to: 'works_of_art#edit'
  patch '/works_of_art/:id', to: 'works_of_art#update'
  delete '/works_of_art/:id', to: 'works_of_art#destroy'

end
