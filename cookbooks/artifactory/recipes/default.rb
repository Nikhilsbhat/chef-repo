#
# Cookbook Name:: artifactory
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "install_unzip" do
  command 'sudo apt-get install unzip'
  user "root"
end

remote_file '/root/jfrog-artifactory-oss-4.7.7.zip' do
  source 'https://bintray.com/jfrog/artifactory/download_file?file_path=jfrog-artifactory-oss-4.7.7.zip'
  action :create_if_missing
  user 'root'
  mode '0644'
end

include_recipe 'unzip::default'

ruby_block "Copy artifact file" do
   block do
     ::FileUtils.cp "/root/artifactory-oss-4.7.7/webapps/artifactory.war", "/root/artifactory-oss-4.7.7/tomcat/webapps/"
   end
end

execute 'install_artifact' do
  command 'sudo /root/artifactory-oss-4.7.7/bin/./installService.sh'
  cwd '/root/'
  user 'root'
end

cookbook_file '/etc/opt/jfrog/artifactory/default' do
  source 'default'
  mode '0644'
end

execute 'start_artifact' do
  command 'sudo /artifactory-oss-4.7.7/tomcat/bin/./startup.sh'
  cwd '/root/'
  user 'root'
end

execute "sudo service artifactory start" do
  user "root"
end
