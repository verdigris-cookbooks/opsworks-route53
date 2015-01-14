name             'opsworks_route53'
maintainer       'Andrew Jo'
maintainer_email 'andrew@verdigris.co'
license          'Simplified BSD'
description      'Sets up AWS Route53 DNS table with instance hostname and FQDN'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

%w(amazon debian ubuntu).each do |platform|
  supports platform
end

depends 'route53'
