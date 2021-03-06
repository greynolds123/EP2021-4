#
# reverse.rb
#
module Puppet::Parser::Functions
  newfunction(:reverse, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Reverses the order of a string or array.

    Note that the same can be done with the reverse_each() function in Puppet.
=======
    @summary
      Reverses the order of a string or array.

    @return
      reversed string or array

    > *Note:* that the same can be done with the reverse_each() function in Puppet.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Reverses the order of a string or array.

    Note that the same can be done with the reverse_each() function in Puppet.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Reverses the order of a string or array.

    Note that the same can be done with the reverse_each() function in Puppet.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Reverses the order of a string or array.

    Note that the same can be done with the reverse_each() function in Puppet.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Reverses the order of a string or array.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "reverse(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'reverse(): Requires either array or string to work with')
    end

    result = value.reverse

    return result
  end
end

# vim: set ts=2 sw=2 et :
