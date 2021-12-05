#
# shuffle.rb
#
module Puppet::Parser::Functions
  newfunction(:shuffle, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Randomizes the order of a string or array elements.
=======
  @summary
    Randomizes the order of a string or array elements.

   @return
     randomized string or array
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Randomizes the order of a string or array elements.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Randomizes the order of a string or array elements.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Randomizes the order of a string or array elements.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Randomizes the order of a string or array elements.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "shuffle(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'shuffle(): Requires either array or string to work with')
    end

    result = value.clone

    string = value.is_a?(String) ? true : false

    # Check whether it makes sense to shuffle ...
    return result if result.size <= 1

    # We turn any string value into an array to be able to shuffle ...
    result = string ? result.split('') : result

    elements = result.size

    # Simple implementation of Fisher–Yates in-place shuffle ...
    elements.times do |i|
      j = rand(elements - i) + i
      result[j], result[i] = result[i], result[j]
    end

    result = string ? result.join : result

    return result
  end
end

# vim: set ts=2 sw=2 et :
