set :application, "handling"
set :user , "deploy"
set :repository,  "svn+ssh://#{user}@lastchance.ro/var/www/apps/handling"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
 set :deploy_to, "/var/www/apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :domain , "lastchance.ro"
role :app, domain
role :web, domain
role :db,  domain, :primary => true
default_run_options[:pty] = true

set :scm_username, user
set :runner, user

set :mongrel_servers, 1
set :mongrel_port, 8000
set :rails_env, 'production'