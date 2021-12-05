#
# is_array.rb
#
module Puppet::Parser::Functions
  newfunction(:is_array, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the variable passed to this function is an array.
=======
    @summary
      **Deprecated:** Returns true if the variable passed to this function is an array.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the variable passed to this function is an array.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the variable passed to this function is an array.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
             ) do |arguments|

    function_deprecation([:is_array, 'This method is deprecated, please use the stdlib validate_legacy function,
                           with Stdlib::Compat::Array. There is further documentation for validate_legacy function in the README.'])

    raise(Puppet::ParseError, "is_array(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    type = arguments[0]

    result = type.is_a?(Array)

    return result
  end
end
