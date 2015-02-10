# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'news'
set :repo_url, 'git@github.com:lulalala/news.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/app/news'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
linked_files = fetch(:linked_files, [])
linked_files.push('config/app_config.yml')
linked_files.push('config/database.yml')
linked_files.push('config/newrelic.yml')
linked_files.push('config/database.yml')
set :linked_files, linked_files

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for keep_releases is 5
# set :keep_releases, 5

set :ssh_options, {:forward_agent => true}

set :rbenv_type, :user
set :rbenv_ruby, '2.1.0-preview1'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
