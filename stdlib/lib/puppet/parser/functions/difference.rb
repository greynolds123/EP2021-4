#
# difference.rb
#
module Puppet::Parser::Functions
  newfunction(:difference, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
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
    This function returns the difference between two arrays.
    The returned array is a copy of the original array, removing any items that
    also appear in the second array.

    *Examples:*

        difference(["a","b","c"],["b","c","d"])

    Would return: ["a"]

    Note: Since Puppet 4 the minus (-) operator in the Puppet language does the same thing:

      ['a', 'b', 'c'] - ['b', 'c', 'd']
      # would return ['a']
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function returns the difference between two arrays.

    The returned array is a copy of the original array, removing any items that
    also appear in the second array.

    @example Example usage

      difference(["a","b","c"],["b","c","d"])
      Would return: `["a"]`

    > *Note:*
    Since Puppet 4 the minus (-) operator in the Puppet language does the same thing:
    ['a', 'b', 'c'] - ['b', 'c', 'd']
    Would return: `['a']`

    @return [Array]
      The difference between the two given arrays
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

=======
    This function returns the difference between two arrays.
    The returned array is a copy of the original array, removing any items that
    also appear in the second array.

    *Examples:*

        difference(["a","b","c"],["b","c","d"])

    Would return: ["a"]
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    # Two arguments are required
    raise(Puppet::ParseError, "difference(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size != 2

    first = arguments[0]
    second = arguments[1]

    unless first.is_a?(Array) && second.is_a?(Array)
      raise(Puppet::ParseError, 'difference(): Requires 2 arrays')
    end

    result = first - second

    return result
  end
end

# vim: set ts=2 sw=2 et :
