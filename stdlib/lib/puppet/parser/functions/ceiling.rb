#
#  ceiling.rb
#
module Puppet::Parser::Functions
  newfunction(:ceiling, :type => :rvalue, :doc => <<-DOC
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
    Returns the smallest integer greater or equal to the argument.
    Takes a single numeric value as an argument.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      **Deprecated** Returns the smallest integer greater or equal to the argument.
    Takes a single numeric value as an argument.

    > *Note:*
      **Deprecated** from Puppet 6.0.0, this function has been replaced with a
      built-in [`ceiling`](https://puppet.com/docs/puppet/latest/function.html#ceiling) function.

    @return [Integer] The rounded value
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "ceiling(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    begin
      arg = Float(arguments[0])
    rescue TypeError, ArgumentError => _e
      raise(Puppet::ParseError, "ceiling(): Wrong argument type given (#{arguments[0]} for Numeric)")
    end

    raise(Puppet::ParseError, "ceiling(): Wrong argument type given (#{arg.class} for Numeric)") if arg.is_a?(Numeric) == false

    arg.ceil
  end
end

# vim: set ts=2 sw=2 et :
