Blog::Application.routes.draw do

  resources :projects

  root :to => 'pages#home'

end
