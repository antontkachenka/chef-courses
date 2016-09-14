#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

yum_package 'unzip' do
  action :install
  not_if "rpm -qa | grep -qx 'unzip'"
end

execute "download_and_unzip_jboss" do
  command <<-EOH
    cd ~
    wget http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip
    yum install -y unzip 
    unzip jboss-as-distribution-6.1.0.Final.zip -d /usr/share
  EOH
  action :run
end

cookbook_file "/usr/share/jboss-6.1.0.Final/server/default/deploy/testweb.war" do 
  source "testweb.war"
  action :create
end

cookbook_file "/usr/share/jboss-6.1.0.Final/server/default/deploy/testweb.xml" do
  source "testweb.xml"
  action :create
end

cookbook_file "/etc/init.d/jboss" do
  source "jboss"
  action :create
  mode '0755'
end

user "jboss" do
  manage_home true
  shell '/bin/bash'
  action :create
end

execute 'chown_for_jboss_folder' do
  command "chown -R jboss.jboss /usr/share/jboss-6.1.0.Final/"
end

service 'jboss' do
  supports :restart => true, :status => false, :stop => true, :start => true
  action [ :enable, :start ]
end
