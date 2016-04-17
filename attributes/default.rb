###############################################################################
# Cookbook Name:: zmq
# Attributes:: default
# Copyright 2016, Joshua C. Burt
###############################################################################

default['zmq']['base'] = '/usr/local'
default['zmq']['src'] = '/usr/local/src/zmq'
default['zmq']['src_url'] = 'https://github.com/zeromq/zeromq4-1.git'
default['zmq']['version'] = 'v4.1.4'
default['zmq']['lib'] = 'libzmq.so'
