source 'https://rubygems.org'

gem 'rails' #,     :git => 'git://github.com/rails/rails.git'

gem 'haml'
gem 'friendly_id'
gem 'foreigner', :git => 'git://github.com/matthuhiggins/foreigner.git'
gem 'paperclip'
gem 'aws-sdk'
gem "remotipart", "~> 1.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails', "~> 2.6"
  gem "capybara"
  gem 'capybara-webkit'
  gem 'sqlite3', :platform => [:ruby]
  gem 'foreman'
end

gem 'jquery-rails'

group :production do 
  gem "pg"
  gem 'thin'
end
  

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
