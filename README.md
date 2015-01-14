# opsworks_route53

[![Build Status](https://travis-ci.org/verdigris-cookbooks/opsworks-route53.svg?branch=master)](https://travis-ci.org/verdigris-cookbooks/opsworks-route53)

This is a cookbook for automatically configuring Amazon's [Route 53](http://aws.amazon.com/route53)
DNS service from instance hostname. It will use the IAM role assigned to your
OpsWorks instances.

## Requirements

* IAM role policy that allows modifying Route53 zone record sets

### Platforms

* Amazon Linux
* Ubuntu 12.04 LTS
* Ubuntu 14.04 LTS

### Cookbooks

* **route53**

## Attributes

| Key                                        |  Type   | Description                                                                                                                       |                      Default                     |
|:-------------------------------------------|:-------:|:----------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------:|
| `[:opsworks_route53][:domainname]`         | String  | Domain name that will be appended to your hostname                                                                                | `node[:opsworks][:stack][:domainname]` if exists |
| `[:opsworks_route53][:prepend_stack_name]` | Boolean | If `true`, prepends a slugified version of your OpsWorks stack name to the domain name (e.g. `OpsWorks Stack` → `opsworks-stack`) |                      `true`                      |
| `[:opsworks_route53][:ttl]`                | Integer | Resource record cache time to live (TTL) in seconds                                                                               |                      `300`                       |
| `[:opsworks_route53][:zone_id]`            | String  | ID string of your Route 53 Hosted Zone                                                                                            |                      `nil`                       |

## Recipes

This cookbook only has a default recipe. It is recommended to add this recipe
to the **Configure** lifecycle event of your stack layer.

## License

This cookbook is licensed and distributed under the Simplified BSD license.
See [LICENSE](https://github.com/verdigris-cookbooks/opsworks-route53/blob/master/LICENSE)
for more details.
