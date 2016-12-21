#
# Cookbook Name:: jdk
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get update" do
  user "root"
end

execute "sudo apt-get install -y openjdk-7-jdk" do
  user "root"
end
