#
# Cookbook Name:: maven
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute "apt-get update" do
  user "root"
end


execute "sudo apt-get install -y openjdk-7-jdk" do
  user "root"
end

execute "sudo apt-get install -y maven" do 
  user "root"
end

cookbook_file '/root/.bash_profile' do
  source '.bash_profile'
  mode '0644'
end

include_recipe 'tomcat::default'
