#
# is_function_available.rb
#
module Puppet::Parser::Functions
  newfunction(:is_function_available, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
    This function accepts a string as an argument, determines whether the
    Puppet runtime has access to a function by that name.  It returns a
    true if the function exists, false if not.
=======
    @summary
      **Deprecated:** Determines whether the Puppet runtime has access to a function by that name.

    This function accepts a string as an argument.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
    DOC
             ) do |arguments|

    if arguments.size != 1
      raise(Puppet::ParseError, "is_function_available?(): Wrong number of arguments given #{arguments.size} for 1")
    end

    # Only allow String types
    return false unless arguments[0].is_a?(String)

    function = Puppet::Parser::Functions.function(arguments[0].to_sym)
    function.is_a?(String) && !function.empty?
  end
end

# vim: set ts=2 sw=2 et :
