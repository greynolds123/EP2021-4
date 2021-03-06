#
# unique.rb
#
module Puppet::Parser::Functions
  newfunction(:unique, :type => :rvalue, :doc => <<-DOC
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
    This function will remove duplicates from strings and arrays.

    *Examples:*

        unique("aabbcc")

    Will return:

        abc

    You can also use this with arrays:

        unique(["a","a","b","b","c","c"])

    This returns:

        ["a","b","c"]
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function will remove duplicates from strings and arrays.

    @return
      String or array with duplicates removed

    @example **Usage**

      unique("aabbcc")
      Will return: abc

      You can also use this with arrays:

      unique(["a","a","b","b","c","c"])
      This returns: ["a","b","c"]

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

=======
    This function will remove duplicates from strings and arrays.

    *Examples:*

        unique("aabbcc")

    Will return:

        abc

    You can also use this with arrays:

        unique(["a","a","b","b","c","c"])

    This returns:

        ["a","b","c"]
    DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    if Puppet::Util::Package.versioncmp(Puppet.version, '5.0.0') >= 0
      function_deprecation([:unique, 'This method is deprecated, please use the core puppet unique function. There is further documentation for the function in the release notes of Puppet 5.0.'])
    end

    raise(Puppet::ParseError, "unique(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'unique(): Requires either array or string to work with')
    end

    result = value.clone

    string = value.is_a?(String) ? true : false

    # We turn any string value into an array to be able to shuffle ...
    result = string ? result.split('') : result
    result = result.uniq # Remove duplicates ...
    result = string ? result.join : result

    return result
  end
end

# vim: set ts=2 sw=2 et :
