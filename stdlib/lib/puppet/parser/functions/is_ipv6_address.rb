#
# is_ipv6_address.rb
#
module Puppet::Parser::Functions
  newfunction(:is_ipv6_address, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the string passed to this function is a valid IPv6 address.
=======
    @summary
      **Deprecated:** Returns true if the string passed to this function is a valid IPv6 address.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the string passed to this function is a valid IPv6 address.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the string passed to this function is a valid IPv6 address.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
             ) do |arguments|

    function_deprecation([:is_ipv6_address, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with Stdlib::Compat::Ipv6. There is further documentation for validate_legacy function in the README.'])

    require 'ipaddr'

    if arguments.size != 1
      raise(Puppet::ParseError, "is_ipv6_address(): Wrong number of arguments given #{arguments.size} for 1")
    end

    begin
      ip = IPAddr.new(arguments[0])
    rescue ArgumentError
      return false
    end

    return ip.ipv6?
  end
end

# vim: set ts=2 sw=2 et :
