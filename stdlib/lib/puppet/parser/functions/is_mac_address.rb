#
# is_mac_address.rb
#
module Puppet::Parser::Functions
  newfunction(:is_mac_address, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the string passed to this function is a valid mac address.
=======
    @summary
      **Deprecated:** Returns true if the string passed to this function is a valid mac address.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the string passed to this function is a valid mac address.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    DOC
             ) do |arguments|

    if arguments.size != 1
      raise(Puppet::ParseError, "is_mac_address(): Wrong number of arguments given #{arguments.size} for 1")
    end

    mac = arguments[0]

    return true if %r{^[a-f0-9]{1,2}(:[a-f0-9]{1,2}){5}$}i =~ mac
    return true if %r{^[a-f0-9]{1,2}(:[a-f0-9]{1,2}){19}$}i =~ mac
    return false
  end
end

# vim: set ts=2 sw=2 et :
