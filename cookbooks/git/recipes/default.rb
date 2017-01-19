#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'install_git' do
  command 'sudo apt-get update'
  cwd '/root/'
  user 'root'
end

execute 'install_git' do
  command 'sudo apt-get install -y git-core'
  cwd '/root/'
  user 'root'
end

