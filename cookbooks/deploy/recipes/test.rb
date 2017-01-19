%w[ /home/ubuntu/nikhil /home/ubuntu/bhat /home/ubuntu/soorya  /home/ubuntu/nikhil/bar /home/ubuntu/nikhil/bar/baz /home/ubuntu/soorya/bhat].each do |path|
  directory path do
  owner 'ubuntu'
  group 'ubuntu'
  mode  '0777'
  end
end

remote_file 'Copy service file' do 
  path '/home/ubuntu/nikhil/bar/baz/pom.xml' 
  source 'file:///home/ubuntu/deploy/current/pom.xml'
  owner 'ubuntu'
  group 'ubuntu'
  mode  '0644'
end

