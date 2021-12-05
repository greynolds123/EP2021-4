#
# abs.rb
#
module Puppet::Parser::Functions
  newfunction(:abs, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    Returns the absolute value of a number, for example -34.56 becomes
    34.56. Takes a single integer and float value as an argument.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      **Deprecated:** Returns the absolute value of a number

    For example -34.56 becomes 34.56.
    Takes a single integer or float value as an argument.

    > *Note:*
      **Deprected** from Puppet 6.0.0, the built-in
      ['abs'](https://puppet.com/docs/puppet/6.4/function.html#abs)function will be used instead.

    @return The absolute value of the given number if it was an Integer

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "abs(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    # Numbers in Puppet are often string-encoded which is troublesome ...
    if value.is_a?(String)
      if value =~ %r{^-?(?:\d+)(?:\.\d+){1}$}
        value = value.to_f
      elsif value =~ %r{^-?\d+$}
        value = value.to_i
      else
        raise(Puppet::ParseError, 'abs(): Requires float or integer to work with')
      end
    end

    # We have numeric value to handle ...
    result = value.abs

    return result
  end
end

# vim: set ts=2 sw=2 et :
