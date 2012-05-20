Blog::Application.routes.draw do

  namespace :admin do
    resource :session
    resources :blog_images
    resources :blog_posts do
      put :publish, on: :member
    end
    resources :blog_comments do
      put :verify, on: :member
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
  get "author/ihid" => redirect("/blog")

  get "category/*subcategory" => redirect("/blog")

  get "page/2" => redirect("/blog")

  get "2011/03" => redirect("/blog")
  get "2011/05" => redirect("/blog")
  get "2011/06" => redirect("/blog")
  get "2012/01" => redirect("/blog")
  get "2012/02" => redirect("/blog")
  
  get "about_me" => redirect("/pages/about")
  
  get "blog/creating-an-ec2-webserver-using-amazon-s-basic-ami--2" => redirect("blog/creating-an-ec2-webserver-using-amazon-s-basic-ami")
  get "removing-duplicate-code-by-using-blocks-in-ruby" => redirect("/blog")
  get "having-a-hobby-project" => redirect("/blog")
  get "blog/schema.org" => redirect("/blog/markup-your-blog-using-schema-org")
  get "blog/search" => redirect("/blog")

  {
    "a-scope-for-returning-no-records-in-activerecord" => "a-scope-for-returning-no-records-in-activerecord",
    "allow-escape_attrs-on-a-per-tag-basis-in-haml" => "allow-escape_attrs-on-a-per-tag-basis-in-haml",
    "highly-targeted-advertising-on-ruby-forum-com" => "highly-targeted-advertising-on-ruby-forum-com",
    "ranges-not-accepted-for-form-select-tags-in-rails-3-2" => "form-select-tag-does-not-accept-ranges-in-rails-3-2",
    "bug-in-rails-3-2-activerecord-store-typeerror-cant-convert-symbol-into-integer" => "bug-in-rails-3-2-activerecord-store-typeerror-can-t-convert-symbol-into-integer",
    "rubygems-1-8-2-broke-my-rake" => "rubygems-1-8-2-broke-my-rake",
    "bug-in-rails-3-1-when-setting-table_name-when-using-multiple-namespaces" => "bug-in-setting-table_name-when-using-multiple-namespaces",
    "creating-an-ec2-webserver-using-amazons-basic-ami" => "creating-an-ec2-webserver-using-amazon-s-basic-ami",
    "iphone-error-the-user-name-or-password-for-imap-gmail-com-is-incorrect" => "iphone-error-the-user-name-or-password-for-imap-gmail-com-is-incorrect",
    "why-ed-miliband-not-ken-clarke-should-be-apologising-tonight" => "why-ed-miliband-not-ken-clarke-should-be-apologising-tonight",
    "fixed-foreigner-gem-to-work-with-reversing-migrations-in-rails-3-1" => "fixed-foreigner-gem-to-work-with-reversing-migrations-in-rails-3-1",
    "belongs_to_enum-is-released" => "belongs_to_enum-is-released",
    "testing-views-with-rails-3-rspec-2-and-webrat" => 'testing-views-with-rails-3-rspec-2-and-webrat',
    "haml-is-broken-with-partial-layouts" => "haml-is-broken-with-partial-layouts",
    "creating-a-ec2-webserver-using-amazons-basic-ami" => "creating-an-ec2-webserver-using-amazon-s-basic-ami",
    "form-select-tag-does-not-accept-ranges-in-rails-3-2" => "form-select-tag-does-not-accept-ranges-in-rails-3-2",
    }.each do |old_url, blog_post_title|
    get old_url => redirect("/blog/#{blog_post_title}")
    get "#{old_url}/feed" => redirect("/blog/#{blog_post_title}")
  end
  ##########################
  ## End of Legacy Routes ##
  ##########################

  get "sitemap" => "pages#sitemap"
  root :to => 'pages#index'

end
