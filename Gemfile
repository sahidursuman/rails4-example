source 'https://rubygems.org' do

  gem 'rails', '4.2.7.1'

  gem 'mysql2', '0.3.21'

  gem 'sass-rails', '~> 5.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.1.0'
  gem 'therubyracer', platforms: :ruby

  gem 'haml'
  gem "haml-rails"

  gem 'jquery-rails'
  gem 'jquery-ui-rails'

  gem 'turbolinks'
  gem 'jquery-turbolinks'

  gem 'jbuilder', '~> 2.0'

  gem 'bootstrap', '4.0.0.alpha4'
  gem "font-awesome-rails"

  gem 'devise', '4.2.0'
  gem 'cancancan'
  gem 'classy_enum', '~> 3.4'

  gem 'figaro'

  group :doc do
    # bundle exec rake doc:rails generates the API under doc/api.
    gem 'sdoc', require: false
  end

  group :development do
    gem 'capistrano', '~> 3.2.0', require: false
    gem 'capistrano-rails', '~> 1.1', require: false
    gem 'capistrano-bundler', '~> 1.1', require: false

    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'

    gem 'pry', require:false
    gem 'quiet_assets'
    gem 'better_errors'
    gem 'binding_of_caller'
    gem 'awesome_print', require:'ap'
    gem 'meta_request'
    gem 'web-console', '~> 2.0'  #use <%= console %> in views

    gem 'rubocop', require: false
    gem 'rubocop-rspec', require: false
    gem 'reek', '~> 4', require: false
    gem 'haml-lint', require: false
    gem 'rails_best_practices', require:false
    gem 'annotate', '~> 2.6.5', require:false

  end

  group :development, :test do
    gem 'rspec-rails', '~> 3.4'
    gem 'factory_girl_rails'
  end

  group :test do
    gem 'faker', '~> 1.4.3'
    gem 'capybara', '~> 2.4.3'
    gem 'database_cleaner', '~> 1.3.0'
    gem 'launchy', '~> 2.4.2'
    gem 'selenium-webdriver', '~> 2.43.0'
  end
end

source 'https://rails-assets.org' do
  gem 'rails-assets-footable', '2.0.3'
  gem 'rails-assets-tether', '>= 1.1.0'
end
