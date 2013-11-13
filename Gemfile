source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mysql2'
gem 'pg'
gem 'sqlite3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '~> 1.3.0'
  gem "compass-rails"
  gem 'gistyle'
end

gem 'jquery-rails', '~> 3.0.4'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy
gem 'capistrano'
gem "capistrano-nginx", "~> 0.1.0"
gem "turbo-sprockets-rails3"

# Caching
gem 'dalli', "~> 2.6.2"

# System
gem "lograge", "~> 0.2.0"
gem 'multi_logger'

gem "oj", "~> 2.0.10"
gem "multi_json", "~> 1.7.2"

gem 'seed-fu'
gem 'seedbank', '~> 0.3.0.pre2'

# ActiveRecord enhancement
gem 'squeel', '~> 1.0.18'
gem "counter_culture", "~> 0.1.12"

# View
gem 'cells', '~> 3.8.8'

gem 'meta-tags', "~> 1.4.1", :require => 'meta_tags'
gem 'simple_form', '~> 2.1.0'

gem "anjlab-bootstrap-rails", :require => "bootstrap-rails"
gem "bootstrap_helper"

gem 'unobtrusive_flash', git: 'git://github.com/lulalala/unobtrusive_flash.git'
gem 'colorbox-rails', github:'lazywei/colorbox-rails'

gem "high_voltage"

# Fetch
gem 'nokogiri'
gem "addressable", "~> 2.3.4"
gem 'taiwanese_news_parser', github:'lulalala/taiwanese_news_parser'

# Pagination
gem 'kaminari'

# Authentication
gem 'devise', '~> 3.1.0'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'cancan'

gem "settingslogic", "~> 2.0.9"

gem "rails_admin"

group :development do
  gem "nifty-generators", "~> 0.4.6"
  gem "better_errors"
  gem 'quiet_assets'

  # To use debugger
  # gem 'debugger'

# Guard
  gem 'growl', '~> 1.0.3'
  gem 'rb-fsevent', '~> 0.9.3'
  gem "guard", "~> 1.8.0"
  gem 'guard-livereload', "~> 1.1.3"
  gem 'guard-rspec', "~> 3.0.2"
  gem "spork-rails", github:'lulalala/spork-rails'
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
  gem "rspec-rails", "~> 2.13.2"
end

gem "letter_opener", :group => :development

gem 'acts-as-taggable-on'
