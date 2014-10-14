#
# Cookbook Name:: railo
# Attribute File:: default
#
# Author:: Roland Ringgenberg <roland.ringgenberg@ringgi.net>
#
# Copyright 2014 RRTechnologies
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_attribute "opsworks_java::default"

default['railo']['app_server'] = 'tomcat'
default['railo']['user']['id'] = "tomcat#{node['opsworks_java']['tomcat']['base_version']}"
default['railo']['port'] = node['opsworks_java']['tomcat']['port']
default['railo']['major_version'] = '4'
default['railo']['minor_version'] = '2'
default['railo']['base_installation_directory'] = '/opt'
default['railo']['config_dir'] = '/var/lib/railo/config'

include_attribute "railo::railo_server"
