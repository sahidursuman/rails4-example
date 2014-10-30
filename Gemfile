source 'https://rubygems.org'

gem 'rails', '4.1.6'

gem 'mysql2'

gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0'
gem 'therubyracer', platforms: :ruby

gem 'haml'
gem "haml-rails"

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'turbolinks'
gem 'jquery-turbolinks'

gem 'jbuilder', '~> 2.0'

gem 'less-rails-bootstrap', '~> 3.0'

gem 'devise'
gem 'cancan'
gem 'classy_enum', '~> 3.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'capistrano', '2.15.4'
  gem "better_errors"
  gem "binding_of_caller"

  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rubocop', require: false
  gem 'haml-lint', require: false
  gem 'reek', require:false
  gem 'rails_best_practices', require:false

end

group :development, :test do
  gem 'rspec-rails', '~> 2'
  gem 'factory_girl_rails', '~> 4'
end

group :test do
  gem 'faker', '~> 1'
  gem 'capybara', '~> 2'
  gem 'database_cleaner', '~> 1'
  gem 'launchy', '~> 2'
  gem 'shoulda-matchers', '~> 2'
  gem 'selenium-webdriver', '~> 2'
end

# temp fix for cap deploy
# https://github.com/net-ssh/net-ssh/issues/145
gem 'net-ssh', '2.7.0'
gem 'net-ssh-gateway', '1.2.0'

