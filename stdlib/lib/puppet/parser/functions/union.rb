#
# union.rb
#
module Puppet::Parser::Functions
  newfunction(:union, :type => :rvalue, :doc => <<-DOC
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
    This function returns a union of two or more arrays.

    *Examples:*

        union(["a","b","c"],["b","c","d"])

    Would return: ["a","b","c","d"]
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function returns a union of two or more arrays.

    @return
      a unionized array of two or more arrays
    @example **Usage**

      union(["a","b","c"],["b","c","d"])
      Would return: ["a","b","c","d"]
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    # Check that 2 or more arguments have been given ...
    raise(Puppet::ParseError, "union(): Wrong number of arguments given (#{arguments.size} for < 2)") if arguments.size < 2

    arguments.each do |argument|
      raise(Puppet::ParseError, 'union(): Every parameter must be an array') unless argument.is_a?(Array)
    end

    arguments.reduce(:|)
  end
end

# vim: set ts=2 sw=2 et :
