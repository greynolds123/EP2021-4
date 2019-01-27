#
# suffix.rb
#
<<<<<<< HEAD

module Puppet::Parser::Functions
  newfunction(:suffix, :type => :rvalue, :doc => <<-EOS
This function applies a suffix to all elements in an array, or to the keys
in a hash.

*Examples:*

    suffix(['a','b','c'], 'p')

Will return: ['ap','bp','cp']
    EOS
  ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "suffix(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    enumerable = arguments[0]

    unless enumerable.is_a?(Array) or enumerable.is_a?(Hash)
=======
module Puppet::Parser::Functions
  newfunction(:suffix, :type => :rvalue, :doc => <<-DOC
    This function applies a suffix to all elements in an array, or to the keys
    in a hash.

    *Examples:*

        suffix(['a','b','c'], 'p')

    Will return: ['ap','bp','cp']
    DOC
             ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "suffix(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    enumerable = arguments[0]

    unless enumerable.is_a?(Array) || enumerable.is_a?(Hash)
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19
      raise Puppet::ParseError, "suffix(): expected first argument to be an Array or a Hash, got #{enumerable.inspect}"
    end

    suffix = arguments[1] if arguments[1]

    if suffix
      unless suffix.is_a? String
        raise Puppet::ParseError, "suffix(): expected second argument to be a String, got #{suffix.inspect}"
      end
    end

<<<<<<< HEAD
    if enumerable.is_a?(Array)
      # Turn everything into string same as join would do ...
      result = enumerable.collect do |i|
        i = i.to_s
        suffix ? i + suffix : i
      end
    else
      result = Hash[enumerable.map do |k,v|
        k = k.to_s
        [ suffix ? k + suffix : k, v ]
      end]
    end
=======
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
>>>>>>> f3fab20366c13fba7b36956f886163721fed8b19

    return result
  end
end

# vim: set ts=2 sw=2 et :
