name "rabbitmq_flugel"
version "0.1.0"
maintainer 'Flugel'
maintainer_email 'tiago@flugel.it'
description "Installs and TEST rabbitmq configuration"

recipe 'rabbitmq', "Install standalone rabbitmq"

depends 'erlang'
depends 'yum-epel'
depends 'yum-erlang_solutions'
depends 'dpkg_autostart'
depends 'rabbitmq'

supports 'centos', '>= 7.0'