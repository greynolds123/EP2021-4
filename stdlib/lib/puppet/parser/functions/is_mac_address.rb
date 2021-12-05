#
# is_mac_address.rb
#
module Puppet::Parser::Functions
  newfunction(:is_mac_address, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the string passed to this function is a valid mac address.
=======
    @summary
      **Deprecated:** Returns true if the string passed to this function is a valid mac address.

    @return [Boolean]
      Returns `true` or `false`
=======
    Returns true if the string passed to this function is a valid mac address.
    DOC
             ) do |arguments|

    if arguments.size != 1
      raise(Puppet::ParseError, "is_mac_address(): Wrong number of arguments given #{arguments.size} for 1")
    end
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the string passed to this function is a valid mac address.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the string passed to this function is a valid mac address.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the string passed to this function is a valid mac address.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

<<<<<<< HEAD
    if arguments.size != 1
      raise(Puppet::ParseError, "is_mac_address(): Wrong number of arguments given #{arguments.size} for 1")
    end

    mac = arguments[0]

    return true if %r{^[a-f0-9]{1,2}(:[a-f0-9]{1,2}){5}$}i =~ mac
    return true if %r{^[a-f0-9]{1,2}(:[a-f0-9]{1,2}){19}$}i =~ mac
=======
    return true if %r{^[a-f0-9]{1,2}(:[a-f0-9]{1,2}){5}$}i =~ mac
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    return false
  end
end

# vim: set ts=2 sw=2 et :
