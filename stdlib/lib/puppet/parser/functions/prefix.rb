#
# prefix.rb
#
module Puppet::Parser::Functions
  newfunction(:prefix, :type => :rvalue, :doc => <<-DOC
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
    This function applies a prefix to all elements in an array or a hash.

    *Examples:*

        prefix(['a','b','c'], 'p')

    Will return: ['pa','pb','pc']

    Note that since Puppet 4.0.0 the general way to modify values is in array is by using the map
    function in Puppet. This example does the same as the example above:

        ['a', 'b', 'c'].map |$x| { "p${x}" }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function applies a prefix to all elements in an array or a hash.

    @example **Usage**

      prefix(['a','b','c'], 'p')
      Will return: ['pa','pb','pc']

    > *Note:* since Puppet 4.0.0 the general way to modify values is in array is by using the map
    function in Puppet. This example does the same as the example above:
    ['a', 'b', 'c'].map |$x| { "p${x}" }

    @return [Hash] or [Array] The passed values now contains the passed prefix
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    This function applies a prefix to all elements in an array or a hash.

    *Examples:*

        prefix(['a','b','c'], 'p')

    Will return: ['pa','pb','pc']
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "prefix(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    enumerable = arguments[0]

    unless enumerable.is_a?(Array) || enumerable.is_a?(Hash)
      raise Puppet::ParseError, "prefix(): expected first argument to be an Array or a Hash, got #{enumerable.inspect}"
    end

    prefix = arguments[1] if arguments[1]

    if prefix
      unless prefix.is_a?(String)
        raise Puppet::ParseError, "prefix(): expected second argument to be a String, got #{prefix.inspect}"
      end
    end

    result = if enumerable.is_a?(Array)
               # Turn everything into string same as join would do ...
               enumerable.map do |i|
                 i = i.to_s
                 prefix ? prefix + i : i
               end
             else
               Hash[enumerable.map do |k, v|
                 k = k.to_s
                 [prefix ? prefix + k : k, v]
               end]
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
