# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'dotenv-rails', '~> 2.6.0', groups: %i[development test]
gem 'rails', '~> 5.2.1'
gem 'rake', '= 12.3.2'

gem 'actionview', '>= 5.2.2.1'
gem 'active_storage_validations', '~> 0.5'
gem 'api-pagination', '>= 4.8.1'
gem 'apipie-rails', '>= 0.5.14'
gem 'batch-loader', '1.3.0'
gem 'cancancan', '>= 2.3.0'
gem 'closure_tree', '>= 7.0.0 '
gem 'data_uri', '0.1.0'
gem 'devise', '>= 4.6.0'
gem 'devise_token_auth'
gem 'discard', '>= 1.0.0'
gem 'faker', '>= 1.9.1', require: false
gem 'graphiql-rails', '>= 1.5.0'
gem 'graphql', '1.9.5'
gem 'graphql-guard', '~> 1.2.1'
gem 'kaminari', '>= 1.1.1'
gem 'loofah', '>= 2.2.3'
gem 'maxmind-db', '~> 1.0'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'postmark-rails', '~> 0.19.0'
gem 'railties', '>= 5.2.2.1'
gem 'rufus-scheduler', '>= 3.5.2'
gem 'typhoeus', '>= 1.3.1'
gem 'validates_timeliness', '~> 5.0.0.alpha3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'rack', '>= 2.0.6'
gem 'rack-cors', require: 'rack/cors'

# Reduces boot times through caching; required in config/boot.rb
# gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-bundler'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-rails-console'
  gem 'capistrano-rvm'
  gem 'capistrano-upload-config'
  gem 'capistrano3-nginx'
  gem 'capistrano3-puma'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'brakeman', require: false
end

group :test do
  gem 'action-cable-testing', '~> 0.5.0'
  gem 'simplecov', '>= 0.16.0', require: false
  gem 'webmock', '>= 3.4.2'
end
gem 'factory_bot', '>= 4.0.0'
gem 'factory_bot_rails', '>= 4.0.0'

group :staging do
  gem 'cloudflare-rails'
end

group :production do
  gem 'cloudflare-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'eth'
gem 'newrelic_rpm'

gem 'sanitize', '~> 5.0'
