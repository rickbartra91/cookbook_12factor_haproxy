include_recipe "haproxy::install_#{node['haproxy']['install_method']}"

# TODO this needs to be removed, it's just for the initial testing/dev
node.override['discover']['haproxy_backend']['ipaddresses']['127.0.0.1']['hostname'] = 'localhost'

list = node.discover.haproxy_backend.ipaddresses.map do |addr, opts|
  next if opts['disable']

  { :ipaddress => addr, :hostname => opts['hostname'] }
end

node.override['haproxy']['pool_members'] = list.compact

template "#{node['haproxy']['conf_dir']}/haproxy.cfg" do
  cookbook node['12factor_haproxy']['config_cookbook']
  source node['12factor_haproxy']['config_template']
  owner "root"
  group "root"
  mode 00644
  variables(
    :pool_members => node['haproxy']['pool_members'],
    :defaults_options => haproxy_defaults_options,
    :defaults_timeouts => haproxy_defaults_timeouts
  )
  notifies :reload, "service[haproxy]"
end

include_recipe 'haproxy::service_mgmt'
