#
# Cookbook:: jenkins_test
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_repository 'jenkins' do
    uri          node['jenkins']['master']['repository']
    distribution 'binary/'
    key          node['jenkins']['master']['repository_key']
  end
package 'jenkins' do
  version node['jenkins']['master']['version']
end

service 'jenkins' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end
