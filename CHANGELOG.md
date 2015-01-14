# v1.0.0

* Backwards incompatible attribute changes:
  * `[:opsworks][:route53][:domainname]` →
    `[:opsworks_route53][:domainname]`
  * Default value for domain name is `[:opsworks][:stack][:domainname]`
  * `[:opsworks][:route53][:prepend_stack_name]` →
    `[:opsworks_route53][:prepend_stack_name]`
  * `[:opsworks][:route53][:ttl]` →
    `[:opsworks_route53][:ttl]`
  * `[:opsworks][:route53][:zone_id]` →
    `[:opsworks_route53][:zone_id]`
* ChefSpec tests added

# v0.1.1

* Support for customizable record cache time to live (TTL) values

# v0.1.0

* Initial release
