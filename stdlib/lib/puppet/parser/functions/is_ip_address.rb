#
# is_ip_address.rb
#
module Puppet::Parser::Functions
  newfunction(:is_ip_address, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the string passed to this function is a valid IP address.
=======
    @summary
      **Deprecated:** Returns true if the string passed to this function is a valid IP address.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the string passed to this function is a valid IP address.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the string passed to this function is a valid IP address.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the string passed to this function is a valid IP address.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns true if the string passed to this function is a valid IP address.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    require 'ipaddr'

    function_deprecation([:is_ip_address, 'This method is deprecated, please use the stdlib validate_legacy function,
                           with Stdlib::Compat::Ip_address. There is further documentation for validate_legacy function in the README.'])

    if arguments.size != 1
      raise(Puppet::ParseError, "is_ip_address(): Wrong number of arguments given #{arguments.size} for 1")
    end

    begin
      ip = IPAddr.new(arguments[0])
    rescue ArgumentError
      return false
    end

    return true if ip.ipv4? || ip.ipv6?
    return false
  end
end

# vim: set ts=2 sw=2 et :
