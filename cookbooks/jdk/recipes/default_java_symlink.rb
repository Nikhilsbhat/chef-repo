# Cookbook Name:: jdk
# Recipe:: default_java_symlink

link '/usr/lib/jvm/default-java' do
  to node['jdk']['java_home']
  not_if { node['jdk']['java_home'] == '/usr/lib/jvm/default-java' }
end

