require 'chefspec'
require 'chefspec/berkshelf'

describe 'opsworks_route53::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      node.set[:opsworks][:stack][:name] = "Test Stack"
      node.set[:opsworks][:instance] = {
        :hostname => "foo",
        :private_ip => "12.345.678.901"
      }
      node.set[:opsworks_route53] = {
        :domainname => "bar.com",
        :zone_id => "Z1D6330EXAMPLE"
      }
    end.converge(described_recipe)
  end

  it 'includes route53 recipe' do
    expect(chef_run).to include_recipe('route53')
  end

  it 'creates DNS A record' do
    expect(chef_run).to create_route53_record('foo.test-stack.bar.com')
  end

  it 'creates DNS A record when prepend_stack_name is false' do
    chef_run.node.set[:opsworks_route53][:prepend_stack_name] = false
    chef_run.converge described_recipe
    expect(chef_run).to create_route53_record('foo.bar.com')
  end
end
