#
# flatten.rb
#
module Puppet::Parser::Functions
  newfunction(:flatten, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    This function flattens any deeply nested arrays and returns a single flat array
    as a result.

    *Examples:*

        flatten(['a', ['b', ['c']]])

    Would return: ['a','b','c']

    Note: from Puppet 5.5.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function flattens any deeply nested arrays and returns a single flat array
      as a result.

    @return
      convert nested arrays into a single flat array

    @example Example usage

      flatten(['a', ['b', ['c']]])` returns: `['a','b','c']

    > **Note:** **Deprecated** from Puppet 5.5.0, this function has been replaced with a
    built-in [`flatten`](https://puppet.com/docs/puppet/latest/function.html#flatten) function.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "flatten(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    array = arguments[0]

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'flatten(): Requires array to work with')
    end

    result = array.flatten

    return result
  end
end

# vim: set ts=2 sw=2 et :
