#
# Cookbook Name:: railo
# Attribute File:: railo_server
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

# below here is for railo config
default['railo']['web_password'] = "railoweb"
default['railo']['server_password'] = "railoserver"
default['railo']['datasources'] = {}