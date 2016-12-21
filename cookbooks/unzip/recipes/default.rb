#
# Cookbook Name:: unzip
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

ruby_block "unzip a file" do
   block do
     if Dir.exists?('/root/artifactory-oss-4.7.7')
     else
       Zip::File.open("/root/jfrog-artifactory-oss-4.7.7.zip") do |zipfile|
         zipfile.each do |file|
         end
       end
     end
   end
end
