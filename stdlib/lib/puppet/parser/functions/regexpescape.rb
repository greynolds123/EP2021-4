#
#  regexpescape.rb
#
module Puppet::Parser::Functions
  newfunction(:regexpescape, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Regexp escape a string or array of strings.
    Requires either a single string or an array as an input.
=======
    @summary
      Regexp escape a string or array of strings.
      Requires either a single string or an array as an input.
    @return [String]
      A string of characters with metacharacters converted to their escaped form.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Regexp escape a string or array of strings.
    Requires either a single string or an array as an input.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Regexp escape a string or array of strings.
    Requires either a single string or an array as an input.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Regexp escape a string or array of strings.
    Requires either a single string or an array as an input.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Regexp escape a string or array of strings.
    Requires either a single string or an array as an input.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
  ) do |arguments| # rubocop:disable Layout/ClosingParenthesisIndentation
    raise(Puppet::ParseError, "regexpescape(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    value = arguments[0]

    unless value.is_a?(Array) || value.is_a?(String)
      raise(Puppet::ParseError, 'regexpescape(): Requires either array or string to work with')
    end

    result = if value.is_a?(Array)
               # Numbers in Puppet are often string-encoded which is troublesome ...
               value.map { |i| i.is_a?(String) ? Regexp.escape(i) : i }
             else
               Regexp.escape(value)
             end

    return result
  end
end

# vim: set ts=2 sw=2 et :
