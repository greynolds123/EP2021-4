#
# zip.rb
#
module Puppet::Parser::Functions
  newfunction(:zip, :type => :rvalue, :doc => <<-DOC
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
    Takes one element from first array and merges corresponding elements from second array. This generates a sequence of n-element arrays, where n is one more than the count of arguments.

    *Example:*

        zip(['1','2','3'],['4','5','6'])

    Would result in:

        ["1", "4"], ["2", "5"], ["3", "6"]
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Takes one element from first array and merges corresponding elements from second array.

    @return
      This generates a sequence of n-element arrays, where n is one more than the count of arguments.

    @example
      zip(['1','2','3'],['4','5','6'])
      Would result in: ["1", "4"], ["2", "5"], ["3", "6"]
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    # Technically we support three arguments but only first is mandatory ...
    raise(Puppet::ParseError, "zip(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size < 2

    a = arguments[0]
    b = arguments[1]

    unless a.is_a?(Array) && b.is_a?(Array)
      raise(Puppet::ParseError, 'zip(): Requires array to work with')
    end

    flatten = function_str2bool([arguments[2]]) if arguments[2]

    result = a.zip(b)
    result = flatten ? result.flatten : result

    return result
  end
end

# vim: set ts=2 sw=2 et :
