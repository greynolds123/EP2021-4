#
#  upcase.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:upcase, :type => :rvalue, :doc => <<-DOC
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
    Converts a string or an array of strings to uppercase.

    *Examples:*

        upcase("abcd")

    Will return:

        ABCD

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Converts a string or an array of strings to uppercase.

    @return
      converted string ot array of strings to uppercase

    @example **Usage**

      upcase("abcd")
      Will return ABCD

    > *Note:* from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    will be used instead of this function.
=======
    Converts a string or an array of strings to uppercase.

    *Examples:*

        upcase("abcd")

    Will return:

        ABCD
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |arguments|

    raise(Puppet::ParseError, "upcase(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.size != 1

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(Hash) || value.respond_to?(:upcase)
      raise(Puppet::ParseError, 'upcase(): Requires an array, hash or object that responds to upcase in order to work')
    end

    if value.is_a?(Array)
      # Numbers in Puppet are often string-encoded which is troublesome ...
      result = value.map { |i| function_upcase([i]) }
    elsif value.is_a?(Hash)
      result = {}
      value.each_pair do |k, v|
        result[function_upcase([k])] = function_upcase([v])
      end
    else
      result = value.upcase
    end

    return result
  end
end

# vim: set ts=2 sw=2 et :
