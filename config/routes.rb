Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  # Galleries
  get '/galleries', to: 'galleries#index'
  get '/galleries/new', to: 'galleries#new'
  get '/galleries/:id', to: 'galleries#show'
  get 'galleries/:id/edit', to: 'galleries#edit'
  post '/galleries', to: 'galleries#create'
  patch '/galleries/:id', to: 'galleries#update'
end
