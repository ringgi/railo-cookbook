Railo Cookbook
=================

This cookbook installs Railo (right now on tomcat)

Requirements
------------

The cookbook has been tested on Ubuntu 12.04, but should work on most platforms where Java 6 or 7 work.

### Platforms
- Ubuntu

### Cookbooks
- java
- tomcat

And the dependencies of the java and tomcat cookbooks

Attributes
----------
* `node['railo']['app_server']` Type of web application server (currently only tomcat)
* `node['railo']['user']['id']` User name
* `node['railo']['major_version']` Major version of Railo, default `4`
* `node['railo']['minor_version']` Minor version of Railo, default `1`
* `node['railo']['port']` The Railo/Tomcat port, default `8080`
* `node['railo']['base_installation_directory']` Root directory where the /railo/lib directories will be installed, default `/opt`
* `node['railo']['config_dir']` Full path to the railo configuration directory where the /server and /web directories will be created by Railo, default `/var/lib/railo/config`

Usage
-----
Just include `recipe[railo]` in your node's `run_list` and configure the java and tomcat cookbooks:

```json
{
    "name": "railo-server",
    "description": "A Railo server based on Tomcat",
    "json_class": "Chef::Role",
    "default_attributes": {
        "java": {
            "jdk_version": "7"
        },
        "tomcat": {
            "base_version": "7",
            "deploy_manager_apps": false
        },
        "railo": {
            "major_version": "4",
            "minor_version": "2"
        }
    },
    "override_attributes": {
    },
    "chef_type": "role",
    "run_list": [
        "recipe[railo]"
    ]
}
```

Running the tests
-----------------

A ruby environment with Bundler installed is a prerequisite for using
the testing harness shipped with this cookbook. At the time of this
writing, it works with Ruby 2.0 and Bundler 1.5.3. All programs
involved, with the exception of Vagrant, can be installed by cd'ing
into the parent directory of this cookbook and running "bundle install"

The Rakefile currently ships with an integration test task. Integration tests can also be ran with Test Kitchen
cloud drivers.

Integration tests can be performed on a local workstation using
Virtualbox or VMWare. Detailed instructions for setting this up can be
found at the [Bento](https://github.com/opscode/bento) project web site.

Integration tests using Vagrant can be performed with either
```
bundle exec kitchen test
```
or
```
rake integration:vagrant
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Test your change
5. Submit a Pull Request

License & Authors
-----------------
- Author:: Roland Ringgenberg (<roland.ringgenberg@ringgi.net>)

```text
Copyright:: RRTechnologies

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
