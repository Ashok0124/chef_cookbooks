#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


directory '/tmp/folder' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
template '/tmp/somefile' do
  mode '0755'
  source 'somefile.erb'
  not_if { node[:some_value] }
end
template '/tmp/somefile1' do
  mode '0755'
  source 'somefile.erb'
  only_if do
    File.exist?('/etc/passwd')
  end
end
