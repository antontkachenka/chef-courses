#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install tomcat
package 'tomcat' do
  action :install
end

# install directory for application
package 'tomcat-webapps' do
  action :install
end

# replace default file "server.xml"
template "/etc/tomcat/server.xml" do
  source "server.erb"
  mode '0755'
  variables ({
    'tomcat_port' => node['tomcat']['port']
})
end

# run tomcat
service 'tomcat' do
  supports :restart => true, :status => true, :stop => true, :start => true
  action :start
end
