#
# Cookbook Name:: java17
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#install java 1.7
package node['java']['version'] do
  action :install
end
