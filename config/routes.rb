Blog::Application.routes.draw do

  namespace :admin do
    resource :session
    resources :blog_posts do
      put :publish, on: :member
    end
  end

  resources :blog_posts, path: 'blog' do
    resources :blog_comments 
  end

  resources :projects
  resources :pages

  match "sitemap" => "pages#sitemap"
  root :to => 'pages#index'

end
