#
# basename.rb
#
module Puppet::Parser::Functions
  newfunction(:basename, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Strips directory (and optional suffix) from a filename
=======
    @summary
      Strips directory (and optional suffix) from a filename

    @return [String] The stripped filename
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Strips directory (and optional suffix) from a filename
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Strips directory (and optional suffix) from a filename
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Strips directory (and optional suffix) from a filename
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, 'basename(): No arguments given') if arguments.empty?
    raise(Puppet::ParseError, "basename(): Too many arguments given (#{arguments.size})") if arguments.size > 2
    raise(Puppet::ParseError, 'basename(): Requires string as first argument') unless arguments[0].is_a?(String)

=======
    Strips directory (and optional suffix) from a filename
    DOC
             ) do |arguments|

    raise(Puppet::ParseError, 'basename(): No arguments given') if arguments.empty?
    raise(Puppet::ParseError, "basename(): Too many arguments given (#{arguments.size})") if arguments.size > 2
    raise(Puppet::ParseError, 'basename(): Requires string as first argument') unless arguments[0].is_a?(String)

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    rv = File.basename(arguments[0]) if arguments.size == 1
    if arguments.size == 2
      raise(Puppet::ParseError, 'basename(): Requires string as second argument') unless arguments[1].is_a?(String)
      rv = File.basename(arguments[0], arguments[1])
    end

    return rv
  end
end

# vim: set ts=2 sw=2 et :
