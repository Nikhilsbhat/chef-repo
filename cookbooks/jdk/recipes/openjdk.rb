#cookbook Name:: jdk
# Recipe:: openjdk

include_recipe 'jdk::notify'

unless node.recipe?('jdk::default')
  Chef::Log.warn('Using jdk::default instead is recommended.')

  # Even if this recipe is included by itself, a safety check is nice...
  [node['jdk']['openjdk_packages'], node['jdk']['jdk_home']].each do |v|
    include_recipe 'jdk::set_attributes_from_version' if v.nil? || v.empty?
  end
end


if platform_requires_license_acceptance?
  file '/opt/local/.dlj_license_accepted' do
    owner 'root'
    group 'root'
    mode '0400'
    action :create
    only_if { node['jdk']['accept_license_agreement'] }
  end
end

if node['platform'] == 'ubuntu'
 exec 'sudo add-apt-repository ppa:openjdk-r/ppa'
end

node['jdk']['openjdk_packages'].each do |pkg|
  package pkg do
    version node['jdk']['openjdk_version'] if node['jdk']['openjdk_version']
    notifies :write, 'log[jdk-version-changed]', :immediately
  end
end

java_alternatives 'set-jdk-alternatives' do
  java_location jdk.java_home
  default node['jdk']['set_default']
  priority jdk.alternatives_priority
  case node['jdk']['jdk_version'].to_s
  when '6'
    bin_cmds node['jdk']['jdk']['6']['bin_cmds']
  when '7'
    bin_cmds node['jdk']['jdk']['7']['bin_cmds']
  when '8'
    bin_cmds node['jdk']['jdk']['8']['bin_cmds']
  end
  action :set
  only_if { platform_family?('debian', 'rhel', 'fedora') }
end

if node['jdk']['set_default'] && platform_family?('debian')
  include_recipe 'jdk::default_jdk_symlink'
end

# We must include this recipe AFTER updating the alternatives or else JAVA_HOME
# will not point to the correct java.
include_recipe 'jdk::set_java_home'

