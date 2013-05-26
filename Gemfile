source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mysql2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.3.0'
  gem "compass-rails"
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy
gem 'capistrano'
gem "capistrano-nginx", "~> 0.1.0"
gem "turbo-sprockets-rails3"

# Caching
gem 'dalli', "~> 2.6.2"

# System
gem "lograge", "~> 0.2.0"

gem "oj", "~> 2.0.10"
gem "multi_json", "~> 1.7.2"

gem 'seed-fu'

# ActiveRecord enhancement
gem 'squeel', '~> 1.0.18'

# View
gem 'cells', '~> 3.8.8'

gem 'meta-tags', "~> 1.4.1", :require => 'meta_tags'
gem 'simple_form', '~> 2.1.0'

gem "anjlab-bootstrap-rails", :require => "bootstrap-rails"
gem "bootstrap_helper"

gem 'unobtrusive_flash', git: 'git://github.com/lulalala/unobtrusive_flash.git'

# Fetch
gem 'nokogiri'
gem "addressable", "~> 2.3.4"

# Pagination
gem 'kaminari'

# Authentication
gem 'devise'
gem 'cancan'

group :development do
  gem "nifty-generators", "~> 0.4.6"
  gem "better_errors"

  # To use debugger
  # gem 'debugger'

# Guard
  gem 'growl', '~> 1.0.3'
  gem 'rb-fsevent', '~> 0.9.3'
  gem "guard", "~> 1.6.2"
  gem 'guard-livereload', "~> 1.1.3"
  gem 'guard-rspec', "~> 2.5.1"
  gem 'spork', "~> 0.9.2"
  gem 'guard-spork', "~> 1.5.0"
  gem 'annotate', "~> 2.5.0"
  gem 'guard-annotate', "~> 1.0.0"
end

group :test do
  gem "rspec-cells", "~> 0.1.7"
  gem "capybara", "~> 1.1.2"
  gem 'shoulda-matchers', "~> 1.5.4"
  gem 'valid_attribute'
  gem 'factory_girl_rails', "~> 4.2.1"
  gem "mocha", "~> 0.13.3"
end

group :development, :test do
  gem 'sqlite3'
  gem "rspec-rails", "~> 2.13.0"
end

gem "letter_opener", :group => :development
