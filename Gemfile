source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# A CSS SCSS bootstrap for styling with grids
gem 'zurb-foundation'

# User authentication
gem 'devise'

# Makes rails forms simple
gem 'simple_form'

# Makes image upload easier
gem 'carrierwave'

# Used for image display
gem 'mini_magick'

# Makes it easier to handle nested forms
gem 'cocoon'

# Used for Amazon S3 Support
gem "fog", "~> 1.3.1"

group :production do
	#Neccesary for Heroku Deployment
	gem 'rails_12factor'
end

# Used for test coverage badges
gem 'coveralls', require: false

group :test do
	gem 'shoulda'
	gem 'launchy'
	gem 'valid_attribute'
	gem 'capybara'
	gem 'email_spec'
end

group :development, :test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
	gem 'pry-rails'
	gem 'quiet_assets'
	gem 'dotenv-rails'
	gem 'mailcatcher'
	gem 'rails-erd'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
