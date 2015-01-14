default[:opsworks_route53][:domainname] = node[:opsworks][:stack][:domainname] if node[:opsworks] && node[:opsworks][:stack] && node[:opsworks][:stack][:domainname]
default[:opsworks_route53][:prepend_stack_name] = true
default[:opsworks_route53][:ttl] = 300
