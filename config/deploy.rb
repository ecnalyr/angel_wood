require "bundler/capistrano"
load "deploy/assets"

set :application, "angel_wood"
set :repository,  "git://github.com/ecnalyr/angel_wood.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server = "50.57.75.156"

role :web, server                          # Your HTTP server, Apache/etc
role :app, server                          # This may be the same as your `Web` server
role :db,  server, :primary => true # This is where Rails migrations will run

set :user, "spree"

set :deploy_to, "/home/spree/angel_wood"
set :use_sudo, false

default_run_options[:shell] = '/bin/bash --login'
default_environment["RAILS_ENV"] = 'production'

namespace :unicorn do
  desc "Zero-downtime restart of Unicorn"
  task :restart, except: { no_release: true } do
    run "kill -s USR2 `cat /tmp/unicorn.[angel_wood].pid`"
  end
 
  desc "Start unicorn"
  task :start, except: { no_release: true } do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
  end
 
  desc "Stop unicorn"
  task :stop, except: { no_release: true } do
    run "kill -s QUIT `cat /tmp/unicorn.[angel_wood].pid`"
  end
end
 
after "deploy:restart", "unicorn:restart"

# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"

# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts

# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end

# require "bundler/capistrano"
# load 'deploy/assets'

# set :application, "angel_wood"
# set :user, 'root'
# set :group, 'www-data'
# set :rails_env, 'production'

# role :web, '50.57.75.156'
# role :app, '50.57.75.156'
# role :db,  '50.57.75.156', :primary => true

# set :scm, :git
# set :repository,  "git://github.com/ecnalyr/angel_wood.git"
# set :branch,      "master"
# set :deploy_to,   "/data/#{application}"
# set :deploy_via,  :remote_cache
# set :use_sudo,    false

# default_run_options[:pty] = true
# set :ssh_options, { :forward_agent => true }

# namespace :foreman do
#   desc "Export the Procfile to Bluepill's .pill script"
#   task :export, :roles => :app do
#     run "cd #{current_path} && bundle exec foreman export bluepill /data/#{application}/shared/config"
#     sudo "bluepill load /data/#{application}/shared/config/#{application}.pill"
#   end

 # ?