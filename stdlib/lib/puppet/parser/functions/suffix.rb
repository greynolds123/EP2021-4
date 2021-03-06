#
# suffix.rb
#
module Puppet::Parser::Functions
  newfunction(:suffix, :type => :rvalue, :doc => <<-DOC
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
    This function applies a suffix to all elements in an array, or to the keys
    in a hash.

    *Examples:*

        suffix(['a','b','c'], 'p')

    Will return: ['ap','bp','cp']

    Note that since Puppet 4.0.0 the general way to modify values is in array is by using the map
    function in Puppet. This example does the same as the example above:

        ['a', 'b', 'c'].map |$x| { "${x}p" }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function applies a suffix to all elements in an array, or to the keys
      in a hash.

    @return
      Array or Hash with updated elements containing the passed suffix

    @example **Usage**

      suffix(['a','b','c'], 'p')
      Will return: ['ap','bp','cp']

    > *Note:* that since Puppet 4.0.0 the general way to modify values is in array is by using the map
    function in Puppet. This example does the same as the example above:

    ```['a', 'b', 'c'].map |$x| { "${x}p" }```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

=======
    This function applies a suffix to all elements in an array, or to the keys
    in a hash.

    *Examples:*

        suffix(['a','b','c'], 'p')

    Will return: ['ap','bp','cp']
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "suffix(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    enumerable = arguments[0]

    unless enumerable.is_a?(Array) || enumerable.is_a?(Hash)
      raise Puppet::ParseError, "suffix(): expected first argument to be an Array or a Hash, got #{enumerable.inspect}"
    end

    suffix = arguments[1] if arguments[1]

    if suffix
      unless suffix.is_a? String
        raise Puppet::ParseError, "suffix(): expected second argument to be a String, got #{suffix.inspect}"
      end
    end

    result = if enumerable.is_a?(Array)
               # Turn everything into string same as join would do ...
               enumerable.map do |i|
                 i = i.to_s
                 suffix ? i + suffix : i
               end
             else
               Hash[enumerable.map do |k, v|
                 k = k.to_s
                 [suffix ? k + suffix : k, v]
               end]
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
