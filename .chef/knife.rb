log_level                :info
log_location             STDOUT
node_name                'user'
client_key               '/root/chef-repo/.chef/chefuser.pem'
validation_client_name   'chef-validator'
validation_key           '/root/chef-repo/.chef/masterchef-validator.pem'
chef_server_url          'https://ec2-52-90-35-37.compute-1.amazonaws.com/organizations/chef'
syntax_check_cache_path  '/root/chef-repo/.chef/syntax_check_cache'
cookbook_path [ '/root/chef-repo//cookbooks' ]


knife[:aws_access_key_id] = "AKIAI7I2ZHKOG3BOTLRA"
knife[:aws_secret_access_key] = "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"
knife[:ssh_key_name] = 'nikhil-key'
knife[:region]= "us-west-2"

