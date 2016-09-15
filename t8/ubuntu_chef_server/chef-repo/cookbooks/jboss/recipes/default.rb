#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

yum_package 'unzip' do
  action :install
# not_if "rpm -qa | grep -qx 'unzip'"
end

yum_package 'dejavu-sans-fonts' do
  action :install
end

execute "download_and_unzip_jboss" do
  command <<-EOH
    cd ~
    wget #{node['jboss']['url_jboss']}
    unzip jboss-as-distribution-6.1.0.Final.zip -d #{node['jboss']['path']}
  EOH
  action :run
end

remote_file '/tmp/hudson.zip' do
  source node['appurl']['application_repo'] 
  mode '0755'
  action :create
end

execute 'extract hudson to jboss' do
  command "unzip /tmp/hudson.zip -d #{node['jboss']['app_dir']}"
end


template "/usr/share/jboss-6.1.0.Final/server/default/deploy/hudson/hudson.xml" do
  source "hudson.erb"
  mode '0755'
  variables ({
    'engine' => data_bag_item('t8', 'hudson')['engine']
})
end

cookbook_file "/etc/init.d/jboss" do
  source "jboss"
  action :create
  mode '0755'
end

user node['jboss']['user'] do
  manage_home true
  shell '/bin/bash'
  action :create
end

execute 'chown_for_jboss_folder' do
  command "chown -R jboss.jboss #{node['jboss']['home']}"
end

service 'jboss' do
  supports :restart => true, :status => false, :stop => true, :start => true
  action [ :enable, :start ]
end
