default['jboss']['path'] = '/usr/share'
default['jboss']['home'] = "#{node['jboss']['path']}/jboss-6.1.0.Final"
default['jboss']['app_dir'] = "#{node['jboss']['home']}/server/default/deploy"
default['jboss']['user'] = 'jboss'
default['jboss']['url_jboss'] = "http://download.jboss.org/jbossas/6.1/jboss-as-distribution-6.1.0.Final.zip"
