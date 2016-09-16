# Cookbook Name:: jdk
# Recipe:: set_attributes_from_version

case node['platform_family']


when 'debian'
  node.default['jdk']['java_home'] = "/usr/lib/jvm/java-#{node['jdk']['jdk_version']}-#{node['jdk']['install_flavor']}"
  # Newer Debian & Ubuntu adds the architecture to the path
  if node['platform'] == 'debian' && Chef::VersionConstraint.new('>= 7.0').include?(node['platform_version']) ||
     node['platform'] == 'ubuntu' && Chef::VersionConstraint.new('>= 12.04').include?(node['platform_version'])
    node.default['jdk']['java_home'] = "#{node['jdk']['java_home']}-#{node['kernel']['machine'] == 'x86_64' ? 'amd64' : 'i386'}"
  end
  node.default['jdk']['openjdk_packages'] = ["openjdk-#{node['jdk']['jdk_version']}-jdk", "openjdk-#{node['jdk']['jdk_version']}-jre-headless"]

else
  node.default['jdk']['java_home'] = '/usr/lib/jvm/default-java'
  node.default['jdk']['openjdk_packages'] = ["openjdk-#{node['jdk']['jdk_version']}-jdk"]
end

