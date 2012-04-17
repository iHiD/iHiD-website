Blog::Application.routes.draw do

  namespace :admin do
    resources :blog_posts
  end

  resources :blog_posts, path: 'blog' do
    resources :blog_comments 
  end

  resources :projects
  resources :pages

  root :to => 'pages#index'

end
