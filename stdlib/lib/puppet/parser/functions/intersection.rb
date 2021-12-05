#
# intersection.rb
#
module Puppet::Parser::Functions
  newfunction(:intersection, :type => :rvalue, :doc => <<-DOC
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    This function returns an array of the intersection of two.

    *Examples:*

        intersection(["a","b","c"],["b","c","d"])  # returns ["b","c"]
        intersection(["a","b","c"],[1,2,3,4])      # returns [] (true, when evaluated as a Boolean)
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function returns an array of the intersection of two.

    @return
      an array of the intersection of two.

    @example Example Usage:
      intersection(["a","b","c"],["b","c","d"])  # returns ["b","c"]
      intersection(["a","b","c"],[1,2,3,4])      # returns [] (true, when evaluated as a Boolean)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    # Two arguments are required
    raise(Puppet::ParseError, "intersection(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size != 2

    first = arguments[0]
    second = arguments[1]

    unless first.is_a?(Array) && second.is_a?(Array)
      raise(Puppet::ParseError, 'intersection(): Requires 2 arrays')
    end

    result = first & second

    return result
  end
end

# vim: set ts=2 sw=2 et :
