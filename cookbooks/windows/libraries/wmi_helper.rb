#
# Author:: Adam Edwards (<adamed@chef.io>)
#
<<<<<<< HEAD:cookbooks/windows/libraries/wmi_helper.rb
# Copyright:: 2014-2016, Chef Software, Inc.
=======
# Author:: Sean OMeara <someara@chef.io>
# Copyright 2013, Chef
>>>>>>> chef-vendor-yum:cookbooks/yum/providers/globalconfig.rb
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

<<<<<<< HEAD:cookbooks/windows/libraries/wmi_helper.rb
if RUBY_PLATFORM =~ /mswin|mingw32|windows/
  require 'win32ole'

  def execute_wmi_query(wmi_query)
    wmi = ::WIN32OLE.connect('winmgmts://')
    result = wmi.ExecQuery(wmi_query)
    return nil unless result.each.count > 0
    result
=======
# Allow for Chef 10 support
use_inline_resources if defined?(use_inline_resources)

def whyrun_supported?
  true
end

action :create  do
  template new_resource.path do
    source 'main.erb'
    cookbook 'yum'
    mode '0644'
    variables(:config => new_resource)
>>>>>>> chef-vendor-yum:cookbooks/yum/providers/globalconfig.rb
  end

  def wmi_object_property(wmi_object, wmi_property)
    wmi_object.send(wmi_property)
  end
end
