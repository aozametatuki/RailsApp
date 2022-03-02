Rails.application.routes.draw do
  
  get 'blogs/index'
  get 'blogs/genre'
  get 'blogs/show'
  # questions
  resources :questions

  # answers
  resources :answers
  
  # cards
  get 'cards/index'
  get 'cards', to: 'cards#index'
  get 'cards/add'
  post 'cards/add'
  get 'cards/:id', to: 'cards#show' 
  get 'cards/edit/:id', to: 'cards#edit'
  patch 'cards/edit/:id', to: 'cards#edit'
  get 'cards/delete/:id', to: 'cards#delete'

  #people
  get 'people/index'
  get 'people', to: 'people#index'
  get 'people/:id', to: 'people#show'
  get 'people/add'
  post 'people/add', to: 'people#create'
  get 'people/edit/:id', to: 'people#edit'
  post 'people/edit/:id', to: 'people#update'
  patch 'people/edit/:id', to: 'people#update'
  get 'people/delete/:id', to: 'people#delete'

  # msgboard
  get 'msgboard', to: 'msgboard#index'
  post 'msgboard', to: 'msgboard#index'
  get 'msgboard/index'
  post 'msgboard/index'

  # hello
  get 'hello/index'
  get 'hello', to: 'hello#index'
  post 'hello/index'
  post 'hello', to: 'hello#index'
  get 'hello/other' 

end