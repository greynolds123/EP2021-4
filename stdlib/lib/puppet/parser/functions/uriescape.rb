require 'uri'
#
#  uriescape.rb
#  Please note: This function is an implementation of a Ruby class and as such may not be entirely UTF8 compatible. To ensure compatibility please use this function with Ruby 2.4.0 or greater - https://bugs.ruby-lang.org/issues/10085.
#
module Puppet::Parser::Functions
  newfunction(:uriescape, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
    Urlencodes a string or array of strings.
    Requires either a single string or an array as an input.
=======
    @summary
      Urlencodes a string or array of strings.
      Requires either a single string or an array as an input.

    @return [String]
      a string that contains the converted value

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Urlencodes a string or array of strings.
    Requires either a single string or an array as an input.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "uriescape(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'uriescape(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               # Numbers in Puppet are often string-encoded which is troublesome ...
               value.map { |i| i.is_a?(String) ? URI.escape(i) : i }
             else
               URI.escape(value)
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
