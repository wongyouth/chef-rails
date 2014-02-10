#
# Cookbook Name:: my_app
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'
include_recipe "runit"
include_recipe "database::postgresql"
include_recipe "monit"

rbenv_ruby '2.0.0-p353' do
  global true
end

rbenv_gem 'bundler' do
  ruby_version '2.0.0-p353'
end

postgresql_database_user 'app' do
  connection(
    host: 'localhost',
    username: 'postgres',
    password: 'postgres'
  )
  password 'app'
  action :create
end

postgresql_database 'my_app' do
  owner 'app'
  action :create
  encoding 'utf8'
  collation 'en_US.utf8'
  template 'template0'
  connection(
    host: 'localhost',
    username: 'postgres',
    password: 'postgres'
  )
end

application 'my_app' do
  path '/u/apps/my_app'
  owner 'deploy'
  group 'deploy'

  repository node["rails"]["repository"]

  rails do
    bundler true
    bundle_command  '/opt/rbenv/shims/bundle'
    precompile_assets true

    database_master_role 'postgres-server'
    database do
      database 'my_app'
      username 'app'
      password 'app'
      adapter 'postgresql'
      encoding 'utf8'
    end
  end

  migrate true

  memcached do
    role 'memcached'
  end

  puma do
    bind 'tcp://0.0.0.0:8000'
  end

  #unicorn do
  #  worker_processes 2
  #  port '8000'
  #  preload_app true
  #  copy_on_write true

  #  before_fork <<-'EOS'
  #    defined?(ActiveRecord::Base) and
  #      ActiveRecord::Base.connection.disconnect!

  #    old_pid = "#{server.config[:pid]}.oldbin"
  #    if File.exists?(old_pid) && server.pid != old_pid
  #      begin
  #        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
  #        Process.kill(sig, File.read(old_pid).to_i)
  #      rescue Errno::ENOENT, Errno::ESRCH
  #        # someone else did our job for us
  #      end
  #    end
  #  EOS

  #  after_fork <<-'EOS'
  #    defined?(ActiveRecord::Base) and
  #      ActiveRecord::Base.establish_connection
  #  EOS
  #end

  nginx_load_balancer do
    only_if { node['roles'].include?('nginx') }
    application_server_role 'rails-app'
  end
end
