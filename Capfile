# Load DSL and set up stages
require "capistrano/setup"
# Include default deployment tasks
require "capistrano/deploy"
# Load the SCM plugin appropriate to your project:
#
# require "capistrano/scm/hg"
# install_plugin Capistrano::SCM::Hg
# or
# require "capistrano/scm/svn"
# install_plugin Capistrano::SCM::Svn
# or
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
require "rvm1/capistrano3"
# require "rvm1/capistrano3"
# require "capistrano/rvm"
# require "capistrano/rbenv"
require "capistrano/rbenv"
# require "capistrano/chruby"
require "capistrano/bundler"
# require "capistrano/rails/assets"
@@ -37,6 +37,7 @@ require "capistrano/bundler"
require "capistrano/rails"
require "capistrano/puma"
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Daemon
install_plugin Capistrano::Puma::Nginx

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
  8  
Gemfile
@@ -8,7 +8,7 @@ gem 'rails', '~> 5.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
gem 'puma', '~> 4.3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
@@ -50,10 +50,12 @@ group :development do
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Capistrano
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-puma'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
end

group :test do
  16  
README.md
@@ -2,11 +2,17 @@

1. Use only what you need from the `Gemfile` and copy/paste it to your **own** `Gemfile`. Basically it would be gems related to Capistrano, something like these ones inside the **development group** of your Gemfile
   ```ruby
   gem 'capistrano', '~> 3.10', require: false
   gem 'capistrano-rails', '~> 1.4', require: false
   gem 'capistrano-bundler', '>= 1.1.0'
   gem 'rvm1-capistrano3', require: false
   gem 'capistrano3-puma'
  gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
  gem 'ed25519', '>= 1.2', '< 2.0'
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'
   ```
1. Still in the `Gemfile`, make sure to use the same version as this template for the **puma gem**. Version 5 is installed by default in new application, so it should be changed manually.
   ```ruby
   gem 'puma', '~> 4.3.11'
   ```
1. From this repository, copy/paste those files to the same path of your existing application: `Capfile`, `/config/deploy.rb`, `/config/deploy/production.rb`
1. The `Capfile` file needs to be at the root of your project
 10  
config/deploy.rb
@@ -1,8 +1,12 @@
# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
lock "~> 3.16.0"

set :rbenv_type, :user # or :system, or :fullstaq (for Fullstaq Ruby), depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails puma pumactl}
set :rbenv_roles, :all # default value

before 'deploy', 'rvm1:install:ruby'
set :rvm_map_bins, [ 'rake', 'gem', 'bundle', 'ruby', 'puma', 'pumactl' ]
set :application, "YOUR_FULL_NAME"
set :repo_url, "https://github.com/MY-ACCOUNT/MY-REPO.git"

  9  
config/deploy/production.rb
@@ -3,13 +3,14 @@
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "99.79.123.96", user: "ubuntu", roles: %w{app db web}
server "35.183.131.50", user: "ubuntu", roles: %w{app db web}
# server "example.com", user: "deploy", roles: %w{app web}, other_property: :other_value
# server "db.example.com", user: "deploy", roles: %w{db}
app = ENV['APP']
if app.nil? or app.empty?
  app = "YOUR_FULL_NAME" 
end
set :branch, proc { `git rev-parse --abbrev-ref main`.chomp }
set :application, app
set :rails_env, "development"
set :bundle_without, "production"
@@ -25,9 +26,9 @@
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

role :app, %w{ubuntu@99.79.123.96}
role :web, %w{ubuntu@99.79.123.96}
role :db,  %w{ubuntu@99.79.123.96}
role :app, %w{ubuntu@35.183.131.50}
role :web, %w{ubuntu@35.183.131.50}
role :db,  %w{ubuntu@35.183.131.50}



# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.
# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server "example.com",
#   user: "user_name",
#   roles: %w{web app},
#   ssh_options: {
#     user: "user_name", # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: "please use keys"
#   }