#
# Cookbook Name:: railo
# Recipe:: configure_railo
#
# Author:: Simon Hooker <simon@mso.net>
#
# Copyright 2014 mso.net
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


# copy railo_config.cfm
config_dir = "#{node['opsworks_java']['tomcat']['webapps_base_dir']}/railo-config"

directory config_dir do
  action :create
end

template "#{config_dir}/Application.cfc" do
end

template "#{config_dir}/railo_config.cfm" do
  source "railo_config.cfm.erb"
end

# run railo_config.cfm
http_request "null" do
  url "http://localhost:#{node['opsworks_java']['tomcat']['port']}/railo-config/railo_config.cfm"
end

# delete railo_config.cfm
file "#{config_dir}/railo_config.cfm" do
  action :delete
  user "root"
end
file "#{config_dir}/Application.cfc" do
  action :delete
  user "root"
end
directory config_dir do
  action :delete
end

execute 'restart tomcat' do
  command "service tomcat#{node['tomcat']['base_version']} restart"
end