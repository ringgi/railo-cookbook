name              'railo'
maintainer        'Roland Ringgenberg'
maintainer_email  'roland.ringgenberg@ringgi.net'
license           'Apache 2.0'
description       'Install and setup Railo'
long_description  'The cookbook installs Railo on an existing Java Application Server'
version           '0.1.2'

depends   'tomcat'

supports  'ubuntu'

recipe 'railo::default', 'Runs the railo::tomcat_server recipe'
recipe 'railo::tomcat_server', 'Installs Railo as a webserver on Tomcat'
