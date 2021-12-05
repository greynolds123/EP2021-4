#
# validate_ipv4_address.rb
#
module Puppet::Parser::Functions
  newfunction(:validate_ipv4_address, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
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
=======
    @summary
      Validate that all values passed are valid IPv4 addresses.
      Fail compilation if any value fails this check.

    @return
      passes when the given values are valid IPv4 addresses or raise an error when they are not and fails compilation

    @example **Usage**
      The following values will pass:

        $my_ip = "1.2.3.4"
        validate_ipv4_address($my_ip)
        validate_ipv4_address("8.8.8.8", "172.16.0.1", $my_ip)

      The following values will fail, causing compilation to abort:

        $some_array = [ 1, true, false, "garbage string", "3ffe:505:2" ]
        validate_ipv4_address($some_array)
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    DOC
             ) do |args|

    function_deprecation([:validate_ipv4_address, 'This method is deprecated, please use the stdlib validate_legacy function,
                            with Stdlib::Compat::Ipv4. There is further documentation for validate_legacy function in the README.'])

    require 'ipaddr'
    rescuable_exceptions = [ArgumentError]

    if defined?(IPAddr::InvalidAddressError)
      rescuable_exceptions << IPAddr::InvalidAddressError
    end

    if args.empty?
      raise Puppet::ParseError, "validate_ipv4_address(): wrong number of arguments (#{args.length}; must be > 0)"
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
  end
end
