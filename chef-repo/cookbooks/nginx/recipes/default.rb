#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install nginx
package "nginx" do
  action :install
end

# replace default file "default.conf"
template "/etc/nginx/conf.d/default.conf" do
  source "default.erb"
  mode '0755'
  variables ({
    'nginx_port' => node['nginx']['port'],
    'tomcat_port' => node['tomcat']['port'],
    'jenkins_port' => node['jenkins']['port']
})
end

# run nginx
service 'nginx' do
  supports :restart => true, :status => true, :stop => true, :start => true
  action :start
end

