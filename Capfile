# frozen_string_literal: true

require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/puma'
require 'capistrano/rbenv'
require 'capistrano/scm/git'
install_plugin Capistrano::Puma
install_plugin Capistrano::SCM::Git

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
