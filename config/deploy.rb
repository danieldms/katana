require 'bundler/capistrano'

set :application, "198.211.107.193"
set :repository,  "https://github.com/danieldms/katana-site.git"

set :scm, :git 
set :branch, "master"


set :user, 'root'
set :use_sudo, false
set :deploy_to, "/root/apps/katana-site"
set :deploy_via, "remote_cache"
set :normalize_asset_timestamps, false

role :web, application                          # Your HTTP server, Apache/etc
role :app, application                          # This may be the same as your `Web` server
role :db,  application, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"
after "deploy:restart", "deploy:cleanup"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :bundle_gems do
    run "cd #{deploy_to}/current && bundle install vendor/gems"
  end
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end