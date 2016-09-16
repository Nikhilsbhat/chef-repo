name               'jdk'
maintainer         'nikhil'
maintainer_email   'nikhibt434@gmail.com'
license            'all_rights'
description        'Installs/Configures jdk'
long_description   'IO.read(File.join(File.dirname(__FILE__), 'README.md'))'
version            '0.1.0'


recipe 'jdk::default', 'Installs Java runtime'
recipe 'jdk::default_java_symlink', 'Updates /usr/lib/jvm/default-java'
recipe 'jdk::openjdk', 'Installs the OpenJDK flavor of Java'
recipe 'jdk::purge_packages', 'Purges old Sun JDK packages'
recipe 'jdk::set_attributes_from_version', 'Sets various attributes that depend on jdk_version'
recipe 'jdk::set_java_home', 'Sets the JAVA_HOME environment variable'
recipe 'jdk::oracle_jce', 'Installs the Java Crypto Extension for strong encryption'

%w(
  debian
  ubuntu
  centos
  redhat
  scientific
  fedora
  amazon
  arch
  oracle
  freebsd
  windows
  suse
  xenserver
  smartos
  mac_os_x
).each do |os|
  supports os
end

depends 'apt'

suggests 'aws'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/jdk/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/jdk' if respond_to?(:source_url)
