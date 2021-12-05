#
# bool2num.rb
#
module Puppet::Parser::Functions
  newfunction(:bool2num, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    Converts a boolean to a number. Converts the values:
      false, f, 0, n, and no to 0
      true, t, 1, y, and yes to 1
    Requires a single boolean or string as an input.

    Note that since Puppet 5.0.0 it is possible to create new data types for almost any
    datatype using the type system and the built-in
    [`Numeric.new`](https://puppet.com/docs/puppet/latest/function.html#conversion-to-numeric),
    [`Integer.new`](https://puppet.com/docs/puppet/latest/function.html#conversion-to-integer), and
    [`Float.new`](https://puppet.com/docs/puppet/latest/function.html#conversion-to-float)
    function are used to convert to numeric values.

        notice(Integer(false)) # Notices 0
        notice(Float(true))    # Notices 1.0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Converts a boolean to a number.

    Converts the values:
      ```
      false, f, 0, n, and no to 0
      true, t, 1, y, and yes to 1
      ```
    Requires a single boolean or string as an input.

    > *Note:*
      since Puppet 5.0.0 it is possible to create new data types for almost any
      datatype using the type system and the built-in
      [`Numeric.new`](https://puppet.com/docs/puppet/latest/function.html#conversion-to-numeric),
      [`Integer.new`](https://puppet.com/docs/puppet/latest/function.html#conversion-to-integer), and
      [`Float.new`](https://puppet.com/docs/puppet/latest/function.html#conversion-to-float)
      function are used to convert to numeric values.
      ```
      notice(Integer(false)) # Notices 0
      notice(Float(true))    # Notices 1.0
      ```

    @return [Integer] The converted value as a number
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "bool2num(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = function_str2bool([arguments[0]])

    # We have real boolean values as well ...
    result = value ? 1 : 0

    return result
  end
end

# vim: set ts=2 sw=2 et :
