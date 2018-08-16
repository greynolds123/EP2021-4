<<<<<<< HEAD
module Puppet::Parser::Functions

  newfunction(:validate_ipv4_address, :doc => <<-ENDHEREDOC
=======
#
# validate_ipv4_address.rb
#
module Puppet::Parser::Functions
  newfunction(:validate_ipv4_address, :doc => <<-DOC
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    Validate that all values passed are valid IPv4 addresses.
    Fail compilation if any value fails this check.

    The following values will pass:

    $my_ip = "1.2.3.4"
    validate_ipv4_address($my_ip)
    validate_ipv4_address("8.8.8.8", "172.16.0.1", $my_ip)

    The following values will fail, causing compilation to abort:

    $some_array = [ 1, true, false, "garbage string", "3ffe:505:2" ]
    validate_ipv4_address($some_array)

<<<<<<< HEAD
    ENDHEREDOC
  ) do |args|

    function_deprecation([:validate_ipv4_address, 'This method is deprecated, please use the stdlib validate_legacy function, with Stdlib::Compat::Ipv4. There is further documentation for validate_legacy function in the README.'])

    require "ipaddr"
    rescuable_exceptions = [ ArgumentError ]
=======
    DOC
             ) do |args|

    function_deprecation([:validate_ipv4_address, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with Stdlib::Compat::Ipv4. There is further documentation for validate_legacy function in the README.'])

    require 'ipaddr'
    rescuable_exceptions = [ArgumentError]
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870

    if defined?(IPAddr::InvalidAddressError)
      rescuable_exceptions << IPAddr::InvalidAddressError
    end

<<<<<<< HEAD
    unless args.length > 0 then
      raise Puppet::ParseError, ("validate_ipv4_address(): wrong number of arguments (#{args.length}; must be > 0)")
=======
    if args.empty?
      raise Puppet::ParseError, "validate_ipv4_address(): wrong number of arguments (#{args.length}; must be > 0)"
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end

    args.each do |arg|
      unless arg.is_a?(String)
        raise Puppet::ParseError, "#{arg.inspect} is not a string."
      end

      begin
        unless IPAddr.new(arg).ipv4?
          raise Puppet::ParseError, "#{arg.inspect} is not a valid IPv4 address."
        end
      rescue *rescuable_exceptions
        raise Puppet::ParseError, "#{arg.inspect} is not a valid IPv4 address."
      end
    end
<<<<<<< HEAD

  end

=======
  end
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
end
