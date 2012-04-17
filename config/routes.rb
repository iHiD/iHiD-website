Blog::Application.routes.draw do

  namespace :admin do
    resources :blog_posts do
      put :publish, on: :member
    end
  end

  resources :blog_posts, path: 'blog' do
    resources :blog_comments 
  end

  resources :projects
  resources :pages

  root :to => 'pages#index'

end
