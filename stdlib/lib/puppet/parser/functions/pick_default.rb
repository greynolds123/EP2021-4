#
# pick_default.rb
#
module Puppet::Parser::Functions
  newfunction(:pick_default, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    This function is similar to a coalesce function in SQL in that it will return
    the first value in a list of values that is not undefined or an empty string
    If no value is found, it will return the last argument.
=======
    @summary
      This function will return the first value in a list of values that is not undefined or an empty string.

    @return
      This function is similar to a coalesce function in SQL in that it will return
      the first value in a list of values that is not undefined or an empty string
      If no value is found, it will return the last argument.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    This function is similar to a coalesce function in SQL in that it will return
    the first value in a list of values that is not undefined or an empty string
    If no value is found, it will return the last argument.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    This function is similar to a coalesce function in SQL in that it will return
    the first value in a list of values that is not undefined or an empty string
    If no value is found, it will return the last argument.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    This function is similar to a coalesce function in SQL in that it will return
    the first value in a list of values that is not undefined or an empty string
    If no value is found, it will return the last argument.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e

    Typically, this function is used to check for a value in the Puppet
    Dashboard/Enterprise Console, and failover to a default value like the
    following:

      $real_jenkins_version = pick_default($::jenkins_version, '1.449')

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
    The value of $real_jenkins_version will first look for a top-scope variable
    called 'jenkins_version' (note that parameters set in the Puppet Dashboard/
    Enterprise Console are brought into Puppet as top-scope variables), and,
    failing that, will use a default value of 1.449.

=======
    This function is similar to a coalesce function in SQL in that it will return
    the first value in a list of values that is not undefined or an empty string
    (two things in Puppet that will return a boolean false value). If no value is
    found, it will return the last argument.

    Typically, this function is used to check for a value in the Puppet
    Dashboard/Enterprise Console, and failover to a default value like the
    following:

      $real_jenkins_version = pick_default($::jenkins_version, '1.449')

    The value of $real_jenkins_version will first look for a top-scope variable
    called 'jenkins_version' (note that parameters set in the Puppet Dashboard/
    Enterprise Console are brought into Puppet as top-scope variables), and,
    failing that, will use a default value of 1.449.

>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    Note that, contrary to the pick() function, the pick_default does not fail if
    all arguments are empty. This allows pick_default to use an empty value as
    default.
DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    > *Note:*
      The value of $real_jenkins_version will first look for a top-scope variable
      called 'jenkins_version' (note that parameters set in the Puppet Dashboard/
      Enterprise Console are brought into Puppet as top-scope variables), and,
      failing that, will use a default value of 1.449.

      Contrary to the pick() function, the pick_default does not fail if
      all arguments are empty. This allows pick_default to use an empty value as
      default.
    DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
             ) do |args|
    raise 'Must receive at least one argument.' if args.empty?
    default = args.last
    args = args[0..-2].compact
    args.delete(:undef)
    args.delete(:undefined)
    args.delete('')
    args << default
    return args[0]
  end
end
