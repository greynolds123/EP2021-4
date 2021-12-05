#
# is_bool.rb
#
module Puppet::Parser::Functions
  newfunction(:is_bool, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the variable passed to this function is a boolean.
=======
    @summary
      **Deprecated:** Returns true if the variable passed to this function is a boolean.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the variable passed to this function is a boolean.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the variable passed to this function is a boolean.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the variable passed to this function is a boolean.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    function_deprecation([:is_bool, 'This method is deprecated, please use the stdlib validate_legacy function,
                          with Stdlib::Compat::Bool. There is further documentation for validate_legacy function in the README.'])

    raise(Puppet::ParseError, "is_bool(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    type = arguments[0]

    result = type.is_a?(TrueClass) || type.is_a?(FalseClass)

    return result
  end
end
