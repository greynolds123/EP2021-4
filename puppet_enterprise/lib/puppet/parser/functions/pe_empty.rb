# Namespaced empty function from puppetlabs-stdlib
# https://github.com/puppetlabs/puppetlabs-stdlib/blob/master/lib/puppet/parser/functions/empty.rb

module Puppet::Parser::Functions
  newfunction(:pe_empty, :type => :rvalue, :doc => <<-EOS
Returns true if the variable is empty.
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "pe_empty(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    value = arguments[0]
<<<<<<< HEAD

    unless value.is_a?(Array) || value.is_a?(Hash) || value.is_a?(String) || value.is_a?(Numeric)
      raise(Puppet::ParseError, 'pe_empty(): Requires either ' +
        'array, hash, string or integer to work with')
    end

    if value.is_a?(Numeric)
      return false
    else
      result = value.empty?

      return result
    end
=======
    klass = value.class

    unless [Array, Hash, String].include?(klass)
      raise(Puppet::ParseError, 'pe_empty(): Requires either ' +
        'array, hash or string to work with')
    end

    result = value.empty?

    return result
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
  end
end

# vim: set ts=2 sw=2 et :
