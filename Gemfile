source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'bcrypt-ruby', '~> 3.0.0'

group :development do
  gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git', :require => 'rails_development_boost'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.11.0'
end

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2'
  gem 'bootstrap-sass', '~> 2.3.0.1'
  gem 'bootswatch-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
gem 'jquery-ui-rails'
gem 'bootstrap-datepicker-rails'
gem "on_the_spot"

group :test do
  gem 'rspec-rails', '2.11.0'
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
end

group :production do
  gem 'pg', '0.12.2'
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

gem 'simple_form'
gem 'will_paginate'
gem 'carrierwave'
gem 'thin'