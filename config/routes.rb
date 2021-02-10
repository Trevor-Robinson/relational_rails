Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/galleries', to:'galleries#index'
  get '/galleries/new', to:'galleries#new'
  post '/galleries', to:'galleries#create'
  get '/galleries/:id', to:'galleries#show'
  get '/galleries/:id/edit', to: 'galleries#edit'
  patch '/galleries/:id', to: 'galleries#update'
  delete '/galleries/:id', to: 'galleries#destroy'

  get '/programs', to: 'programs#index'
  get '/galleries/:id/programs', to: 'programs#index'
  get '/galleries/:id/programs/new', to: 'programs#new'
  post '/galleries/:id/programs', to: 'programs#create'
  get '/programs/:id', to: 'programs#show', as: 'program'
  get '/programs/:id/edit', to: 'programs#edit'
  patch '/programs/:id', to: 'programs#update'
  delete '/programs/:id', to: 'programs#destroy'
  #museums routes
  get '/museums', to: 'museums#index'
  get '/museums/new', to: 'museums#new'
  post '/museums', to: 'museums#create'
  get '/museums/:id', to: "museums#show"
  get '/museums/:id/edit', to: "museums#edit"
  patch '/museums/:id', to: 'museums#update'
  delete '/museums/:id', to:'museums#destroy'
  get '/museums/:id/works', to: 'museums#works'
  get '/museums/:id/works/new', to: 'works#new'

  # works routes
  get '/works', to: 'works#index'
  post '/museums/:id/works', to: 'works#create'
  get 'works/:id', to: 'works#show'
  get '/works/:id/edit', to: 'works#edit'
  patch '/works/:id', to: 'works#update'
  delete '/works/:id', to: 'works#destroy'

end
