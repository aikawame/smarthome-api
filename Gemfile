# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

gem 'bootsnap'
gem 'faraday'
gem 'puma'
gem 'rack-cors'

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rbenv'
  gem 'listen'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen'
end
