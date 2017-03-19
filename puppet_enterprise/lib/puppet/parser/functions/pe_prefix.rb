# Namespaced prefix function from puppetlabs-stdlib
# https://github.com/puppetlabs/puppetlabs-stdlib/blob/master/lib/puppet/parser/functions/prefix.rb

module Puppet::Parser::Functions
  newfunction(:pe_prefix, :type => :rvalue, :doc => <<-EOS
This function applies a prefix to all elements in an array.

*Examples:*

    pe_prefix(['a','b','c'], 'p')

Will return: ['pa','pb','pc']
    EOS
  ) do |arguments|

    # Technically we support two arguments but only first is mandatory ...
    raise(Puppet::ParseError, "pe_prefix(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    array = arguments[0]

    unless array.is_a?(Array)
      raise Puppet::ParseError, "pe_prefix(): expected first argument to be an Array, got #{array.inspect}"
    end

    prefix = arguments[1] if arguments[1]

    if prefix
      unless prefix.is_a?(String)
        raise Puppet::ParseError, "pe_prefix(): expected second argument to be a String, got #{prefix.inspect}"
      end
    end

    # Turn everything into string same as join would do ...
    result = array.collect do |i|
      i = i.to_s
      prefix ? prefix + i : i
    end

    return result
  end
end

# vim: set ts=2 sw=2 et :