###############################################################################
# Cookbook Name:: zmq
# Copyright 2016, Joshua C. Burt
###############################################################################

action :compile do
  #############################################################################
  # Execute *nix still compile workflow
  #############################################################################
  execute 'zmq autogen' do
    environment('PATH' => '/usr/local/bin:/usr/bin:/bin')
    command './autogen.sh'
    cwd node['zmq']['src']
    creates ::File.join(node['zmq']['base'], 'lib', node['zmq']['lib'])
  end

  execute 'zmq configure' do
    environment('PATH' => '/usr/local/bin:/usr/bin:/bin')
    command "./configure --prefix=#{node['zmq']['base']}"
    cwd node['zmq']['src']
    creates ::File.join(node['zmq']['base'], 'lib', node['zmq']['lib'])
  end

  execute 'zmq make' do
    environment('PATH' => '/usr/local/bin:/usr/bin:/bin')
    command 'make'
    cwd node['zmq']['src']
    creates ::File.join(node['zmq']['base'], 'lib', node['zmq']['lib'])
  end

  execute 'zmq make check' do
    environment('PATH' => '/usr/local/bin:/usr/bin:/bin')
    command 'make check'
    cwd node['zmq']['src']
    creates ::File.join(node['zmq']['base'], 'lib', node['zmq']['lib'])
  end

  execute 'zmq make install' do
    environment('PATH' => '/usr/local/bin:/usr/bin:/bin')
    command 'make install'
    cwd node['zmq']['src']
    creates ::File.join(node['zmq']['base'], 'lib', node['zmq']['lib'])
  end
end
