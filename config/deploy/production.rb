# frozen_string_literal: true

server '192.168.0.31', user: 'pi', roles: %w[app web]

namespace :puma do
  task :restart do
    on roles(:web) do
      within release_path do
        execute :sh, '-c', "'bundle exec pumactl -S #{shared_path}/tmp/pids/puma.state stop || true'", '>&', '/dev/null'
        execute :sh, '-c', "'nohup bundle exec puma &'", '>&', '/dev/null'
      end
    end
  end
end

after 'deploy:finishing', 'puma:restart'
