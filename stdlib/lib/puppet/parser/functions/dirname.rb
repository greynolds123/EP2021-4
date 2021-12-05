#
# dirname.rb
#
module Puppet::Parser::Functions
  newfunction(:dirname, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Returns the dirname of a path.
=======
    @summary
      Returns the dirname of a path.

    @return [String] the given path's dirname
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Returns the dirname of a path.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Returns the dirname of a path.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    Returns the dirname of a path.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

=======
    Returns the dirname of a path.
    DOC
             ) do |arguments|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    if arguments.empty?
      raise(Puppet::ParseError, 'dirname(): No arguments given')
    end
    if arguments.size > 1
      raise(Puppet::ParseError, "dirname(): Too many arguments given (#{arguments.size})")
    end
    unless arguments[0].is_a?(String)
      raise(Puppet::ParseError, 'dirname(): Requires string as argument')
    end
    # undef is converted to an empty string ''
    if arguments[0].empty?
      raise(Puppet::ParseError, 'dirname(): Requires a non-empty string as argument')
    end

    return File.dirname(arguments[0])
  end
end

# vim: set ts=2 sw=2 et :
