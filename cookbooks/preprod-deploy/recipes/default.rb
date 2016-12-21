#
# Cookbook Name:: preprod-deploy
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file '/var/lib/tomcat7/webapps/gameoflife-web-1.0-20161212.084728-1.war' do
  source 'http://35.163.66.120:8081/artifactory/libs-snapshot-local/com/wakaleo/gameoflife/gameoflife-web/1.0-SNAPSHOT/gameoflife-web-1.0-20161220.055618-1.war'
  action :create_if_missing
  user 'root'
end
