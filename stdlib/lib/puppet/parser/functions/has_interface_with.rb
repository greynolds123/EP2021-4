#
# has_interface_with
#
module Puppet::Parser::Functions
  newfunction(:has_interface_with, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    Returns boolean based on kind and value:
      * macaddress
      * netmask
      * ipaddress
      * network

    has_interface_with("macaddress", "x:x:x:x:x:x")
    has_interface_with("ipaddress", "127.0.0.1")    => true
    etc.

    If no "kind" is given, then the presence of the interface is checked:
    has_interface_with("lo")                        => true
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Returns boolean based on kind and value.

    @return
      boolean values `true` or `false`

    Valid kinds are `macaddress`, `netmask`, `ipaddress` and `network`.

    @example **Usage**
      has_interface_with("macaddress", "x:x:x:x:x:x") # Returns `false`
      has_interface_with("ipaddress", "127.0.0.1") # Returns `true`

    @example If no "kind" is given, then the presence of the interface is checked:
      has_interface_with("lo") # Returns `true`
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
             ) do |args|

    raise(Puppet::ParseError, "has_interface_with(): Wrong number of arguments given (#{args.size} for 1 or 2)") if args.empty? || args.size > 2

    interfaces = lookupvar('interfaces')

    # If we do not have any interfaces, then there are no requested attributes
    return false if interfaces == :undefined || interfaces.nil?

    interfaces = interfaces.split(',')

    if args.size == 1
      return interfaces.member?(args[0])
    end

    kind, value = args

    # Bug with 3.7.1 - 3.7.3  when using future parser throws :undefined_variable
    # https://tickets.puppetlabs.com/browse/PUP-3597
    factval = nil
    begin
      catch :undefined_variable do
        factval = lookupvar(kind)
      end
    rescue Puppet::ParseError # rubocop:disable Lint/HandleExceptions : Eat the exception if strict_variables = true is set
    end
    if factval == value
      return true
    end

    result = false
    interfaces.each do |iface|
      iface.downcase!
      factval = nil
      begin
        # Bug with 3.7.1 - 3.7.3 when using future parser throws :undefined_variable
        # https://tickets.puppetlabs.com/browse/PUP-3597
        catch :undefined_variable do
          factval = lookupvar("#{kind}_#{iface}")
        end
      rescue Puppet::ParseError # rubocop:disable Lint/HandleExceptions : Eat the exception if strict_variables = true is set
      end
      if value == factval
        result = true
        break
      end
    end

    result
  end
end
