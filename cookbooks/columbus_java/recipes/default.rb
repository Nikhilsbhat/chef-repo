#
# Cookbook Name:: columbus_java
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'java'

cookbook_file '/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/US_export_policy.jar' do
	source 'US_export_policy.jar'
	owner 'root'
	group 'root'
	mode 0644
	action :create
end

cookbook_file '/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/security/local_policy.jar' do
	source 'local_policy.jar'
	owner 'root'
	group 'root'
	mode 0644
	action :create
end

# Our Java apps tend to occasionally use more memory than we have physically allocated, so let's add some swap as a buffer.
if node['deco'] && node['memory']['swap']['total'] == '0kB'
  swap_file '/swap_file' do
    size    2048    # MBs
    persist  true
  end
end
