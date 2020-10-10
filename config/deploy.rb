# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"


set :migration_command, 'db:migrate'
set :conditionally_migrate, true
set :migration_role, :app

set :application, "smart_project"
set :repo_url, "git@github.com:leichaofan2024/smart_project.git"

set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value
set :nginx_domains, "175.24.131.85"
set :nginx_service_path, "service nginx"
set :nginx_roles, :web
set :nginx_static_dir, "#{shared_path}/log"
set :nginx_static_dir, "public"
set :nginx_sites_available_dir, "/etc/nginx/sites-available"
set :nginx_application_name, "#{fetch :application}-#{fetch :stage}"
set :nginx_sites_enabled_dir, "/etc/nginx/sites-enabled"
set :nginx_ssl_certificate_key_path, "#{shared_path}/ssl/private"
set :app_server_socket, "#{shared_path}/sockets/unicorn-#{fetch :application}.sock"
set :app_server_port, 80
set :pty,  false


# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"
append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
