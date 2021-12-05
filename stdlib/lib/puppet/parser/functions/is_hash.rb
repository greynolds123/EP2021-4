#
# is_hash.rb
#
module Puppet::Parser::Functions
  newfunction(:is_hash, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the variable passed to this function is a hash.
=======
    @summary
      **Deprecated:** Returns true if the variable passed to this function is a hash.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the variable passed to this function is a hash.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the variable passed to this function is a hash.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the variable passed to this function is a hash.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "is_hash(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    type = arguments[0]

    result = type.is_a?(Hash)

    return result
  end
end

# vim: set ts=2 sw=2 et :
