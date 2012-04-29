source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'certified'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'heroku'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'webrick'
end

group :production do
  gem 'pg'                      # Postgres database
  #gem 'thin'                    # Faster server
end

gem 'jquery-rails'
gem 'devise'                    # User authentication
gem 'omniauth-facebook'         # Facebook login
gem 'omniauth-twitter'
gem 'aws-sdk'                   # For storing images
gem 'paperclip', '~> 2.7'       # For uploading images, version 3.0.1 has issues with uploading to AWS
gem 'thumbs_up', '0.4.5'        # For rating posts
gem 'will_paginate', '~> 3.0.3' # For pagination
gem 'twitter-bootstrap-rails'   # Twitter CSS Framework
gem 'friendly_id'               # For displaying names and titles instead of IDs
gem "ransack"                   # For searching
gem "formtastic", "~> 2.1.1"
gem "rails_admin"

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
