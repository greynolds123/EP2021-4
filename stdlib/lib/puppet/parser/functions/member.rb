<<<<<<< HEAD
#
# member.rb
#

# TODO(Krzysztof Wilczynski): We need to add support for regular expression ...
# TODO(Krzysztof Wilczynski): Support for strings and hashes too ...

module Puppet::Parser::Functions
  newfunction(:member, :type => :rvalue, :doc => <<-EOS
This function determines if a variable is a member of an array.
The variable can be a string, fixnum, or array.

*Examples:*

    member(['a','b'], 'b')

Would return: true

    member(['a', 'b', 'c'], ['a', 'b'])

would return: true

    member(['a','b'], 'c')

Would return: false

    member(['a', 'b', 'c'], ['d', 'b'])

would return: false
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "member(): Wrong number of arguments " +
      "given (#{arguments.size} for 2)") if arguments.size < 2
=======
# TODO(Krzysztof Wilczynski): We need to add support for regular expression ...
# TODO(Krzysztof Wilczynski): Support for strings and hashes too ...
#
# member.rb
#
module Puppet::Parser::Functions
  newfunction(:member, :type => :rvalue, :doc => <<-DOC
    This function determines if a variable is a member of an array.
    The variable can be a string, fixnum, or array.

    *Examples:*

        member(['a','b'], 'b')

    Would return: true

        member(['a', 'b', 'c'], ['a', 'b'])

    would return: true

        member(['a','b'], 'c')

    Would return: false

        member(['a', 'b', 'c'], ['d', 'b'])

    would return: false
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, "member(): Wrong number of arguments given (#{arguments.size} for 2)") if arguments.size < 2
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19

    array = arguments[0]

    unless array.is_a?(Array)
      raise(Puppet::ParseError, 'member(): Requires array to work with')
    end

<<<<<<< HEAD
    unless arguments[1].is_a? String or arguments[1].is_a? Fixnum or arguments[1].is_a? Array
      raise(Puppet::ParseError, 'member(): Item to search for must be a string, fixnum, or array')
    end

    if arguments[1].is_a? String or arguments[1].is_a? Fixnum
      item = [arguments[1]]
    else
      item = arguments[1]
    end


    raise(Puppet::ParseError, 'member(): You must provide item ' +
      'to search for within array given') if item.respond_to?('empty?') && item.empty?
=======
    unless arguments[1].is_a?(String) || arguments[1].is_a?(Integer) || arguments[1].is_a?(Array)
      raise(Puppet::ParseError, 'member(): Item to search for must be a string, fixnum, or array')
    end

    item = if arguments[1].is_a?(String) || arguments[1].is_a?(Integer)
             [arguments[1]]
           else
             arguments[1]
           end

    raise(Puppet::ParseError, 'member(): You must provide item to search for within array given') if item.respond_to?('empty?') && item.empty?
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19

    result = (item - array).empty?

    return result
  end
end

# vim: set ts=2 sw=2 et :
