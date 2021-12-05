#
#  swapcase.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:swapcase, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    This function will swap the existing case of a string.

    *Examples:*

        swapcase("aBcD")

    Would result in: "AbCd"
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function will swap the existing case of a string.

    @return
      string with uppercase alphabetic characters converted to lowercase and lowercase characters converted to uppercase

    @example **Usage**

      swapcase("aBcD")
      Would result in: "AbCd"
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "swapcase(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'swapcase(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               # Numbers in Puppet are often string-encoded which is troublesome ...
               value.map { |i| i.is_a?(String) ? i.swapcase : i }
             else
               value.swapcase
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
