#
# Cookbook Name:: opsworks_route53
# Recipe:: default
#
# Copyright (c) 2015, Verdigris Technologies Inc
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

include_recipe "route53"

z_id = node[:opsworks_route53][:zone_id]
domain = node[:opsworks_route53][:domainname]
subdomain = node[:opsworks][:stack][:name].downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '-')

domain = node[:opsworks_route53][:prepend_stack_name] ? "#{subdomain}.#{domain}" : domain

route53_record "create a record" do
  name      "#{node[:opsworks][:instance][:hostname]}.#{domain}"
  value     node[:opsworks][:instance][:private_ip]
  type      "A"
  ttl       node[:opsworks_route53][:ttl]
  zone_id   z_id
  overwrite true
  action    :create
end
