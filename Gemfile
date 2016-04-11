source 'https://rubygems.org'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'devise'     # user authentication
gem 'mechanize'  # webscraper

group :development, :test do
  gem 'pry', require: false  # interactive debugger
end

group :development do
  gem 'rails-erd', require: false  # entity relationship diagram
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner',   require: false  # database sandbox
  gem 'factory_girl_rails', require: false
  gem 'simplecov',          require: false  # code coverage
  gem 'vcr',                require: false  # record and playback http interactions
  gem 'webmock',            require: false

  # Extra Matchers
  gem 'rspec-its'                         # shorthand for checking an object's attribute
  gem 'shoulda-matchers', require: false  # ActiveRecord-specific matchers
end
