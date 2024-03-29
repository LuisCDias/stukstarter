source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Bootstrap front-end framework
gem 'bootstrap-sass', '~> 3.3.4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Devise for authentication
gem 'devise'
# Simple form
gem 'simple_form'
# Annotate model fields
gem 'annotate'
# Date validator
gem 'date_validator'
# Datetimepicker and Font-awesome
gem 'momentjs-rails', '~> 2.9',  :github => 'derekprior/momentjs-rails'
gem 'datetimepicker-rails', github: 'zpaulovics/datetimepicker-rails', branch: 'master', submodules: true
gem 'font-awesome-sass', '~> 4.3.0'
# Cancancan for authorization
gem 'cancancan', '~> 1.10'
# Braintree for later charges
gem 'braintree'
# Friendly ID
gem 'friendly_id', '~> 5.1.0'
# Delayed Job to Charge funded projects
gem 'delayed_job', '~> 4.0.6'
gem 'delayed_job_active_record'
gem "delayed_job_web"
# Bootstrap WYSIWYG
gem 'bootstrap-wysihtml5-rails', github: 'nerian/bootstrap-wysihtml5-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Load environment variables from .env in development
  gem 'dotenv-rails'
end

group :production do
  # Use Unicorn as the app server
  gem 'unicorn'
  # Use postgres as Active Record database
  gem 'pg'
end
