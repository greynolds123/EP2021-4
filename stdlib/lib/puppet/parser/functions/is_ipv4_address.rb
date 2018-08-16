#
# is_ipv4_address.rb
#
<<<<<<< HEAD

module Puppet::Parser::Functions
  newfunction(:is_ipv4_address, :type => :rvalue, :doc => <<-EOS
Returns true if the string passed to this function is a valid IPv4 address.
    EOS
  ) do |arguments|

    require 'ipaddr'

    function_deprecation([:is_ipv4_address, 'This method is deprecated, please use the stdlib validate_legacy function, with Stdlib::Compat::Ipv4. There is further documentation for validate_legacy function in the README.'])

    if (arguments.size != 1) then
      raise(Puppet::ParseError, "is_ipv4_address(): Wrong number of arguments "+
        "given #{arguments.size} for 1")
=======
module Puppet::Parser::Functions
  newfunction(:is_ipv4_address, :type => :rvalue, :doc => <<-DOC
    Returns true if the string passed to this function is a valid IPv4 address.
    DOC
             ) do |arguments|

    require 'ipaddr'

    function_deprecation([:is_ipv4_address, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with Stdlib::Compat::Ipv4. There is further documentation for validate_legacy function in the README.'])

    if arguments.size != 1
      raise(Puppet::ParseError, "is_ipv4_address(): Wrong number of arguments given #{arguments.size} for 1")
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end

    begin
      ip = IPAddr.new(arguments[0])
    rescue ArgumentError
      return false
    end

    return ip.ipv4?
  end
end

# vim: set ts=2 sw=2 et :
