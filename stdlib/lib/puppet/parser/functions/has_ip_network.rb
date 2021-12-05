#
# has_ip_network
#
module Puppet::Parser::Functions
  newfunction(:has_ip_network, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns true if the client has an IP address within the requested network.
=======
    @summary
      Returns true if the client has an IP address within the requested network.

    @return
      Boolean value, `true` if the client has an IP address within the requested network.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns true if the client has an IP address within the requested network.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns true if the client has an IP address within the requested network.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns true if the client has an IP address within the requested network.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    Returns true if the client has an IP address within the requested network.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

    This function iterates through the 'interfaces' fact and checks the
    'network_IFACE' facts, performing a simple string comparision.
    DOC
             ) do |args|

    raise(Puppet::ParseError, "has_ip_network(): Wrong number of arguments given (#{args.size} for 1)") if args.size != 1

    Puppet::Parser::Functions.autoloader.load(:has_interface_with) \
      unless Puppet::Parser::Functions.autoloader.loaded?(:has_interface_with)

    function_has_interface_with(['network', args[0]])
  end
end

# vim:sts=2 sw=2
