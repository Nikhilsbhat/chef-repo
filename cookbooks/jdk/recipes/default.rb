#
# Cookbook Name:: jdk
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'jdk::set_attributes_from_version'
include_recipe "jdk::#{node['jdk']['install_flavor']}"
