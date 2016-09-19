#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# add repo to install jenkins
remote_file '/etc/yum.repos.d/jenkins.repo' do
  source 'http://pkg.jenkins-ci.org/redhat/jenkins.repo'
end

# add key
execute "add key" do
  command 'rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key'
  action :run
end

# isntall jenkins
package "jenkins" do
  action :install
end

#install git
package "git" do
  action :install
end

# replace default file "jenkins"
template "/etc/sysconfig/jenkins" do
  source 'jenkins.erb'
  mode "0755"
  variables ({
    'jenkins_port' => node['jenkins']['port']
})
end

# replace default file config.xml
template "/var/lib/jenkins/config.xml" do
  source 'config.erb'
  mode "0755"
end

# add jobs
remote_directory '/var/lib/jenkins/jobs' do
  source "jobs"
  action :create
  mode '0755'
  owner 'jenkins'
  group 'jenkins'
end

# add plugins
remote_directory '/var/lib/jenkins/plugins' do
  source "plugins"
  action :create
  mode '0755'
  owner 'jenkins'
  group 'jenkins'
end

# add MAVEN settings
cookbook_file "/var/lib/jenkins/hudson.tasks.Maven.xml" do
  source "hudson.tasks.Maven.xml"
  action :create
  mode '0755'
end

# Add jenkins user to sudoers
cookbook_file "/etc/sudoers.d/jenkins-user" do
  source "jenkins-user"
  action :create
end

# Change user and group to /var/lib/jenkins
execute "add rights" do
  command "sudo chown -R jenkins.jenkins /var/lib/jenkins"
  action :run
end

#start jenkins
service 'jenkins' do
  action :start
end
