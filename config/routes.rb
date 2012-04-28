Blog::Application.routes.draw do

  namespace :admin do
    resource :session
    resources :blog_images
    resources :blog_posts do
      put :publish, on: :member
    end
  end

  resources :blog_posts, path: 'blog' do
    resources :blog_comments 
  end

  resources :projects
  resources :pages

  ###################
  ## Legacy Routes ##
  ###################
  match "author/ihid" => redirect("/blog")

  match "category/webrat" => redirect("/blog")
  match "category/uncategorized" => redirect("/blog")
  match "category/gems/haml" => redirect("/blog")
  match "category/ruby-on-rails" => redirect("/blog")
  match "category/ruby-on-rails/ruby-on-rails-3-2/feed" => redirect("/blog")

  match "page/2" => redirect("/blog")

  match "2011/05" => redirect("/blog")
  match "2012/01" => redirect("/blog")
  match "2012/02" => redirect("/blog")
  
  match "rubygems-1-8-2-broke-my-rake" => redirect("/blog")
  match "bug-in-rails-3-1-when-setting-table_name-when-using-multiple-namespaces" => redirect("/blog")

  {
    "a-scope-for-returning-no-records-in-activerecord" => "a-scope-for-returning-no-records-in-activerecord",
    "allow-escape_attrs-on-a-per-tag-basis-in-haml" => "allow-escape_attrs-on-a-per-tag-basis-in-haml",
    "highly-targeted-advertising-on-ruby-forum-com" => "highly-targeted-advertising-on-ruby-forum-com",
    "ranges-not-accepted-for-form-select-tags-in-rails-3-2" => "form-select-tag-does-not-accept-ranges-in-rails-3-2",
    "bug-in-rails-3-2-activerecord-store-typeerror-cant-convert-symbol-into-integer" => "bug-in-rails-3-2-activerecord-store-typeerror-can-t-convert-symbol-into-integer"
  }.each do |old_url, blog_post_title|
    match old_url => redirect("/blog/#{blog_post_title}")
    match "#{old_url}/feed" => redirect("/blog/#{blog_post_title}")
  end
  ##########################
  ## End of Legacy Routes ##
  ##########################

  match "sitemap" => "pages#sitemap"
  root :to => 'pages#index'

end
