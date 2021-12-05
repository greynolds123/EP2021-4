#
# is_string.rb
#
module Puppet::Parser::Functions
  newfunction(:is_string, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the variable passed to this function is a string.
=======
    @summary
      **Deprecated:** Returns true if the variable passed to this function is a string.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the variable passed to this function is a string.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the variable passed to this function is a string.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the variable passed to this function is a string.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns true if the variable passed to this function is a string.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    function_deprecation([:is_string, 'This method is deprecated, please use the stdlib validate_legacy function,
                          with Stdlib::Compat::String. There is further documentation for validate_legacy function in the README.'])

    raise(Puppet::ParseError, "is_string(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    type = arguments[0]

    # when called through the v4 API shim, undef gets translated to nil
    result = type.is_a?(String) || type.nil?

    if result && (type == type.to_f.to_s || type == type.to_i.to_s)
      return false
    end

    return result
  end
end

# vim: set ts=2 sw=2 et :
