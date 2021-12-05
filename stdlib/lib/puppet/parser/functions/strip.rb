#
#  strip.rb
#
module Puppet::Parser::Functions
  newfunction(:strip, :type => :rvalue, :doc => <<-DOC
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
    This function removes leading and trailing whitespace from a string or from
    every string inside an array.

    *Examples:*

        strip("    aaa   ")

    Would result in: "aaa"

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function removes leading and trailing whitespace from a string or from
      every string inside an array.

    @return
      String or Array converted

    @example **Usage**

      strip("    aaa   ")
      Would result in: "aaa"

    > *Note:*: from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    will be used instead of this function.
    DOC
             ) do |arguments|

=======
    This function removes leading and trailing whitespace from a string or from
    every string inside an array.

    *Examples:*

        strip("    aaa   ")

    Would result in: "aaa"
    DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise(Puppet::ParseError, "strip(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'strip(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               value.map { |i| i.is_a?(String) ? i.strip : i }
             else
               value.strip
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
