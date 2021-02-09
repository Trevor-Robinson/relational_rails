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
  get '/programs/new', to:'programs#new'

  get '/programs/:id', to: 'programs#show', as: 'program'
  get '/programs/:id/edit', to: 'programs#edit'
  patch '/programs/:id', to: 'programs#update'
  delete '/programs/:id', to: 'programs#destroy'


  get '/galleries/:id/programs', to: 'programs#index'
  get '/galleries/:id/programs/new', to: 'programs#new'
  post '/galleries/:id/programs', to: 'programs#create'
end
