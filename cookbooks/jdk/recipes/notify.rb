# Cookbook Name:: jdk
# Recipe:: notify

log 'jdk-version-changed' do
  message 'A new version of java was installed'
  level :info
  action :nothing
end
