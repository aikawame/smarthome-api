# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'
gem 'rails', '~> 6.1.0'

gem 'alexa_rubykit', git: 'https://github.com/isteel/alexa-rubykit.git', branch: 'bundler_2'
gem 'bootsnap'
gem 'faraday'
gem 'puma'
gem 'rack-cors'
gem 'rexml'
gem 'winrm'

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'listen'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-watcher-listen'
end
