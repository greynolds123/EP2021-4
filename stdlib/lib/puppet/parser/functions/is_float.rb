#
# is_float.rb
#
module Puppet::Parser::Functions
  newfunction(:is_float, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the variable passed to this function is a float.
=======
    @summary
      **Deprecated:** Returns true if the variable passed to this function is a float.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the variable passed to this function is a float.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the variable passed to this function is a float.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the variable passed to this function is a float.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns true if the variable passed to this function is a float.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    function_deprecation([:is_float, 'This method is deprecated, please use the stdlib validate_legacy function,
                          with Stdlib::Compat::Float. There is further documentation for validate_legacy function in the README.'])

    if arguments.size != 1
      raise(Puppet::ParseError, "is_float(): Wrong number of arguments given #{arguments.size} for 1")
    end

    value = arguments[0]

    # Only allow Numeric or String types
    return false unless value.is_a?(Numeric) || value.is_a?(String)

    return false if value != value.to_f.to_s && !value.is_a?(Float)
    return true
  end
end

# vim: set ts=2 sw=2 et :
