#
# pick.rb
#
module Puppet::Parser::Functions
<<<<<<< HEAD
  newfunction(:pick, :type => :rvalue, :doc => <<-DOC
    This function is similar to a coalesce function in SQL in that it will return
    the first value in a list of values that is not undefined or an empty string.
    Typically, this function is used to check for a value in the Puppet
    Dashboard/Enterprise Console, and failover to a default value like the following:

      $real_jenkins_version = pick($::jenkins_version, '1.449')

    The value of $real_jenkins_version will first look for a top-scope variable
    called 'jenkins_version' (note that parameters set in the Puppet Dashboard/
    Enterprise Console are brought into Puppet as top-scope variables), and,
    failing that, will use a default value of 1.449.
DOC
=======
  newfunction(:pick, :type => :rvalue, :doc => <<-EOS
    @summary
      This function is similar to a coalesce function in SQL in that it will return
      the first value in a list of values that is not undefined or an empty string.

    @return
      the first value in a list of values that is not undefined or an empty string.

    Typically, this function is used to check for a value in the Puppet
    Dashboard/Enterprise Console, and failover to a default value like the following:

    ```$real_jenkins_version = pick($::jenkins_version, '1.449')```

    > *Note:*
      The value of $real_jenkins_version will first look for a top-scope variable
      called 'jenkins_version' (note that parameters set in the Puppet Dashboard/
      Enterprise Console are brought into Puppet as top-scope variables), and,
      failing that, will use a default value of 1.449.
  EOS
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
             ) do |args|
    args = args.compact
    args.delete(:undef)
    args.delete(:undefined)
    args.delete('')
    raise Puppet::ParseError, 'pick(): must receive at least one non empty value' if args[0].to_s.empty?
    return args[0]
  end
end
