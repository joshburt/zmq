###############################################################################
# Cookbook Name:: zmq
# Recipe:: default
# Copyright 2016, Joshua C. Burt
###############################################################################

###############################################################################
# Ensure we have a sane build environment
###############################################################################
include_recipe 'build-essential'

###############################################################################
# Clone our remote repository
###############################################################################
git node['zmq']['src'] do
  repository node['zmq']['src_url']
  revision node['zmq']['version']
  action :sync
end

###############################################################################
# Execute *nix still compile workflow
###############################################################################
zmq_builder 'zmq compile and install' do
end

###############################################################################
# Configure ourselves in the library cache
###############################################################################
template '/etc/ld.so.conf.d/zmq.conf' do
  group 'root'
  mode '0444'
  owner 'root'
  notifies :run, 'execute[ldconfig]', :immediately
end

###############################################################################
# Update library cache
###############################################################################
execute 'ldconfig' do
  action :nothing
  command 'ldconfig'
end
