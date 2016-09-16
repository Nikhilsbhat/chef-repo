#cookbook Name:: jdk
# Attributes:: default
#
# Copyright 2010-2015, Chef Software, Inc.
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

# default jdk attributes
default['jdk']['jdk_version'] = '7'
default['jdk']['arch'] = node['kernel']['machine'] =~ /x86_64/ ? 'x86_64' : 'i586'
default['jdk']['openjdk_packages'] = []
default['jdk']['openjdk_version'] = nil
default['jdk']['accept_license_agreement'] = false
default['jdk']['set_default'] = true
default['jdk']['alternatives_priority'] = 1062
default['jdk']['set_etc_environment'] = false
default['jdk']['use_alt_suffix'] = true
default['jdk']['reset_alternatives'] = true

