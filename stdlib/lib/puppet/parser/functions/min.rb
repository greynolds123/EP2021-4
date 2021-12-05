#
# min.rb
#
module Puppet::Parser::Functions
  newfunction(:min, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    Returns the lowest value of all arguments.
    Requires at least one argument.

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      **Deprecated:** Returns the lowest value of all arguments.

    Requires at least one argument.

    @return
      The lowest value among the given arguments

    > **Note:** **Deprecated** from Puppet 6.0.0, this function has been replaced with a
    built-in [`min`](https://puppet.com/docs/puppet/latest/function.html#min) function.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |args|

=======
    Returns the lowest value of all arguments.
    Requires at least one argument.
    DOC
             ) do |args|

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    raise(Puppet::ParseError, 'min(): Wrong number of arguments need at least one') if args.empty?

    # Sometimes we get numbers as numerics and sometimes as strings.
    # We try to compare them as numbers when possible
    return args.min do |a, b|
      if a.to_s =~ %r{\A^-?\d+(.\d+)?\z} && b.to_s =~ %r{\A-?\d+(.\d+)?\z}
        a.to_f <=> b.to_f
      else
        a.to_s <=> b.to_s
      end
    end
  end
end
