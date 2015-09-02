#
# Cookbook: collectd_plugins
# License: Apache 2.0
#
# Copyright 2010, Atari, Inc
# Copyright 2015, Bloomberg Finance L.P.
#
include_recipe 'collectd::default'

collectd_plugin 'kafka' do
  user node['collectd']['service_user']
  group node['collectd']['service_group']
  options node['collectd-plugins']['kafka']['options'] unless node['collectd-plugins']['kafka'].nil?
  notifies :restart, "collectd_service[#{node['collectd']['service_name']}]", :delayed
end