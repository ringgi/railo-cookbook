#
# Cookbook Name:: railo
# Recipe:: download_jars
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

# Find out the requested Railo version
case node['railo']['major_version']
  when '3'
    railo_version = '3.3.3.001'
  when '4'
    case node['railo']['minor_version']
      when '1'
        railo_version = '4.1.2.005'
      when '2'
        railo_version = '4.2.1.000'
      else
        railo_version = '4.0.4.001'
      end
  when '5'
    # Does not exists yet TODO: throw an error
  else
    railo_version = '4.2.1.000'
end

# Set the download urls and filename
if node['railo']['major_version'] == '3'
  jars_url = "http://www.getrailo.org/down.cfm?item=/railo/remote/download/db/#{railo_version}/custom/all/railo-#{railo_version}-jars.tar.gz"
elsif node['railo']['major_version'] == '4' && node['railo']['minor_version'] == '2'
  jars_url = "http://www.getrailo.org/down.cfm?item=/railo/remote/download42/#{railo_version}/custom/all/railo-#{railo_version}-jars.tar.gz"
else
  jars_url = "http://www.getrailo.org/down.cfm?item=/railo/remote/download/#{railo_version}/custom/all/railo-#{railo_version}-jars.tar.gz"
end
filename = "railo-#{railo_version}-jars"

# Directories
railo_dir = "#{node['railo']['base_installation_directory']}/railo#{node['railo']['major_version']}"


execute 'create the railo main directory' do
  command "mkdir -pv --mode 0775 #{railo_dir}"
  not_if {::File.exists?("#{railo_dir}")}
end

execute 'download railo jars' do
  command "wget --output-document '#{filename}.tar.gz' #{jars_url}"
  cwd railo_dir
end

execute 'untar the tarball' do
  command "tar -xzvf '#{filename}.tar.gz'"
  cwd railo_dir
end

execute 'remove pre-existing lib' do
  command 'rm -rf lib'
  cwd railo_dir
end

execute 'rename the folder extracted folder' do
  command "mv #{filename} lib"
  cwd railo_dir
end

execute 'delete existing symlink' do
  command 'rm -f railo'
  cwd node['railo']['base_installation_directory']
end

execute 'symlink railo to current version' do
  command "ln -s railo#{node['railo']['major_version']} railo"
  cwd node['railo']['base_installation_directory']
end

# Clean up
file_path = "#{railo_dir}/#{filename}.tar.gz"
file file_path do
  action :delete
end
