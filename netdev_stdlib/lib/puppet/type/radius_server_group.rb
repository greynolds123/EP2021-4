require_relative '../../puppet_x/puppetlabs/netdev_stdlib/check'
if PuppetX::NetdevStdlib::Check.use_old_netdev_type
  Puppet::Type.newtype(:radius_server_group) do
    @doc = 'Configure a RADIUS server group'

    apply_to_all
    ensurable

    newparam(:name, namevar: true) do
      desc 'The name of the RADIUS server group'

      validate do |value|
        if value.is_a? String then super(value)
        else raise "value #{value.inspect} is invalid, must be a String."
        end
      end
    end

    newproperty(:servers, array_matching: :all) do
      desc 'Array of servers associated with this group'

      validate do |value|
        if value.is_a? String then super(value)
        else raise "value #{value.inspect} is invalid, must be a String."
        end
      end

      def should_to_s(new_value = @should)
        self.class.format_value_for_display(new_value)
      end

      def is_to_s(current_value = @is) # rubocop:disable Style/PredicateName
        self.class.format_value_for_display(current_value)
      end
    end
  end

else
  require 'puppet/resource_api'

  Puppet::ResourceApi.register_type(
    name: 'radius_server_group',
    docs: 'Configure a RADIUS server group',
    features: ['canonicalize','simple_get_filter'] + ( Puppet::Util::NetworkDevice.current.nil? ? [] : ['remote_resource'] ),
    attributes: {
      ensure: {
        type:       'Enum[present, absent]',
        desc:       'Whether radius_server_group should be present or absent on the target system.',
        default:    'present'
      },
      name: {
        type:      'String',
        desc:      'The name of the RADIUS server group',
        behaviour: :namevar
      },
      servers: {
        type:      'Optional[Array[String]]',
        desc:      'Array of DNS suffixes to search for FQDN entries'
      }
    }
  )
end
