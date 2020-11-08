# frozen_string_literal: true

lock '~> 3.14.1'

set :application, 'smarthome-api'
set :repo_url, 'git@github.com:aikawame/smarthome-api.git'
set :branch, 'main'
set :linked_files, %w[config/master.key]

set :puma_conf, "#{current_path}/config/puma/production.rb"

set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'
