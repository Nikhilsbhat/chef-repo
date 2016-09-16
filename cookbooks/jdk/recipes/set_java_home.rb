# Cookbook Name:: jdk
# Recipe:: set_java_home

ruby_block 'set-env-java-home' do
  block do
    ENV['JAVA_HOME'] = node['jdk']['java_home']
  end
  not_if { ENV['JAVA_HOME'] == node['jdk']['java_home'] }
end

directory '/etc/profile.d' do
  mode 00755
end

template '/etc/profile.d/jdk.sh' do
  source 'jdk.sh.erb'
  mode 00755
end

if node['jdk']['set_etc_environment'] # ~FC023 -- Fails unit test to use guard
  ruby_block 'Set JAVA_HOME in /etc/environment' do
    block do
      file = Chef::Util::FileEdit.new('/etc/environment')
      file.insert_line_if_no_match(/^JAVA_HOME=/, "JAVA_HOME=#{node['jdk']['java_home']}")
      file.search_file_replace_line(/^JAVA_HOME=/, "JAVA_HOME=#{node['jdk']['java_home']}")
      file.write_file
    end
  end
end

