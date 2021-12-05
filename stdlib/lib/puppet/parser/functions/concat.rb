#
# concat.rb
#
module Puppet::Parser::Functions
  newfunction(:concat, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    Appends the contents of multiple arrays into array 1.

    *Example:*

        concat(['1','2','3'],['4','5','6'],['7','8','9'])

    Would result in:

      ['1','2','3','4','5','6','7','8','9']

    Note: Since Puppet 4.0 concatenation of arrays and hashes can be done with the + operator.

      ['1','2','3'] + ['4','5','6'] + ['7','8','9']
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Appends the contents of multiple arrays into array 1.

    @example Example usage

      concat(['1','2','3'],'4') returns ['1','2','3','4']
      concat(['1','2','3'],'4',['5','6','7']) returns ['1','2','3','4','5','6','7']

    > *Note:*
      Since Puppet 4.0, you can use the `+`` operator for concatenation of arrays and
      merge of hashes, and the `<<`` operator for appending:

    `['1','2','3'] + ['4','5','6'] + ['7','8','9']` returns `['1','2','3','4','5','6','7','8','9']`
    `[1, 2, 3] << 4` returns `[1, 2, 3, 4]`
    `[1, 2, 3] << [4, 5]` returns `[1, 2, 3, [4, 5]]`

    @return [Array] The single concatenated array
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  DOC
             ) do |arguments|

    # Check that more than 2 arguments have been given ...
    raise(Puppet::ParseError, "concat(): Wrong number of arguments given (#{arguments.size} for < 2)") if arguments.size < 2

    a = arguments[0]

    # Check that the first parameter is an array
    unless a.is_a?(Array)
      raise(Puppet::ParseError, 'concat(): Requires array to work with')
    end

    result = a
    arguments.shift

    arguments.each do |x|
      result += (x.is_a?(Array) ? x : [x])
    end

    return result
  end
end

# vim: set ts=2 sw=2 et :
