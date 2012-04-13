Blog::Application.routes.draw do

  resources :projects
  resources :pages
  resources :blog_posts, path: 'blog'

  root :to => 'pages#index'

end
