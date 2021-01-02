# frozen_string_literal: true

lock '~> 3.14.1'

set :application, 'smarthome-api'
set :repo_url, 'git@github.com:aikawame/smarthome-api.git'
set :branch, 'main'
set :linked_files, %w[config/master.key]
set :linked_dirs, %w[log tmp/pids]

# 初回デプロイ時にエラーになる…
set :puma_conf, "#{current_path}/config/puma.rb"

set :rbenv_type, :user
set :rbenv_ruby, '3.0.0'

set :ssh_options, {
  user: 'pi',
  keys: %w[~/.ssh/id_rsa],
  forward_agent: true,
  auth_methods: %w[publickey]
}
