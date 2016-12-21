#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'install_tomcat' do
  command 'sudo apt-get -y install tomcat7'
  user 'root'
  cwd '/root/'
end


execute 'install_admin' do
  command 'sudo apt-get -y install tomcat7-admin'
  cwd '/root/'
  user 
end
