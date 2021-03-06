#
# is_domain_name.rb
#
module Puppet::Parser::Functions
  newfunction(:is_domain_name, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the string passed to this function is a syntactically correct domain name.
=======
    @summary
      **Deprecated:** Returns true if the string passed to this function is
      a syntactically correct domain name.

    @return [Boolean]
      Returns `true` or `false`

    > **Note:* **Deprecated** Will be removed in a future version of stdlib. See
    [`validate_legacy`](#validate_legacy).
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the string passed to this function is a syntactically correct domain name.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the string passed to this function is a syntactically correct domain name.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the string passed to this function is a syntactically correct domain name.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns true if the string passed to this function is a syntactically correct domain name.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    DOC
             ) do |arguments|

    if arguments.size != 1
      raise(Puppet::ParseError, "is_domain_name(): Wrong number of arguments given #{arguments.size} for 1")
    end

    # Only allow string types
    return false unless arguments[0].is_a?(String)

    domain = arguments[0].dup

    # Limits (rfc1035, 3.1)
    domain_max_length = 255
    label_min_length = 1
    label_max_length = 63

    # Allow ".", it is the top level domain
    return true if domain == '.'

    # Remove the final dot, if present.
    domain.chomp!('.')

    # Check the whole domain
    return false if domain.empty?
    return false if domain.length > domain_max_length

    # The top level domain must be alphabetic if there are multiple labels.
    # See rfc1123, 2.1
    return false if domain.include?('.') && !%r{\.[A-Za-z]+$}.match(domain)

    # Check each label in the domain
    labels = domain.split('.')
    vlabels = labels.each do |label|
      break if label.length < label_min_length
      break if label.length > label_max_length
      break if label[-1..-1] == '-'
      break if label[0..0] == '-'
      break unless %r{^[a-z\d-]+$}i =~ label
    end
    return vlabels == labels
  end
end

# vim: set ts=2 sw=2 et :
