#
# enclose_ipv6.rb
#
module Puppet::Parser::Functions
  newfunction(:enclose_ipv6, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Takes an array of ip addresses and encloses the ipv6 addresses with square brackets.
=======
    @summary
      Takes an array of ip addresses and encloses the ipv6 addresses with square brackets.

    @return
      encloses the ipv6 addresses with square brackets.

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Takes an array of ip addresses and encloses the ipv6 addresses with square brackets.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Takes an array of ip addresses and encloses the ipv6 addresses with square brackets.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Takes an array of ip addresses and encloses the ipv6 addresses with square brackets.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  DOC
             ) do |arguments|

    require 'ipaddr'

    rescuable_exceptions = [ArgumentError]
    if defined?(IPAddr::InvalidAddressError)
      rescuable_exceptions << IPAddr::InvalidAddressError
    end

    if arguments.size != 1
      raise(Puppet::ParseError, "enclose_ipv6(): Wrong number of arguments given #{arguments.size} for 1")
    end
    unless arguments[0].is_a?(String) || arguments[0].is_a?(Array)
      raise(Puppet::ParseError, "enclose_ipv6(): Wrong argument type given #{arguments[0].class} expected String or Array")
    end

    input = [arguments[0]].flatten.compact
    result = []

    input.each do |val|
      unless val == '*'
        begin
          ip = IPAddr.new(val)
        rescue *rescuable_exceptions
          raise(Puppet::ParseError, "enclose_ipv6(): Wrong argument given #{val} is not an ip address.")
        end
        val = "[#{ip}]" if ip.ipv6?
      end
      result << val
    end

    return result.uniq
  end
end
