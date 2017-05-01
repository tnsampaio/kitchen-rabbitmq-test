package "git"
package 'logrotate'
package 'socat'

include_recipe "yum-epel"
include_recipe 'erlang'
include_recipe 'rabbitmq'

package "python"
package "python2-pip"
package "python2-pika"

node.default['rabbitmq']['enabled_plugins'] = ['rabbitmq_management']

node['rabbitmq']['enabled_plugins'].each do |plugin|
  rabbitmq_plugin plugin do
    action :enable
    notifies :restart, "service[#{node['rabbitmq']['service_name']}]"
  end
end

node['rabbitmq']['disabled_plugins'].each do |plugin|
  rabbitmq_plugin plugin do
    action :disable
  end
end

template '/tmp/consumer.py' do
  source 'consumer.erb'
  owner 'root'
  group 'root'
  mode '0755'
end
template '/tmp/sender.py' do
  source 'sender.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

log "Base packages installed"