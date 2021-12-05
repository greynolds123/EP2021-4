#
# bool2str.rb
#
module Puppet::Parser::Functions
  newfunction(:bool2str, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    Converts a boolean to a string using optionally supplied arguments. The
    optional second and third arguments represent what true and false will be
    converted to respectively. If only one argument is given, it will be
    converted from a boolean to a string containing 'true' or 'false'.

    *Examples:*

    bool2str(true)                    => 'true'
    bool2str(true, 'yes', 'no')       => 'yes'
    bool2str(false, 't', 'f')         => 'f'

    Requires a single boolean as an input.

    Note that since Puppet 5.0.0 it is possible to create new data types for almost any
    datatype using the type system and the built-in
    [`String.new`](https://puppet.com/docs/puppet/latest/function.html#boolean-to-string)
    function is used to convert to String with many different format options.

<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Converts a boolean to a string using optionally supplied arguments.

    The optional second and third arguments represent what true and false will be
    converted to respectively. If only one argument is given, it will be
    converted from a boolean to a string containing 'true' or 'false'.

    @return
      The converted value to string of the given Boolean

    **Examples of usage**

      ```
        bool2str(true)                    => 'true'
        bool2str(true, 'yes', 'no')       => 'yes'
        bool2str(false, 't', 'f')         => 'f'
      ```

    Requires a single boolean as an input.

    > *Note:*
      since Puppet 5.0.0 it is possible to create new data types for almost any
      datatype using the type system and the built-in
      [`String.new`](https://puppet.com/docs/puppet/latest/function.html#boolean-to-string)
      function is used to convert to String with many different format options.

      ```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        notice(String(false))         # Notices 'false'
        notice(String(true))          # Notices 'true'
        notice(String(false, '%y'))   # Notices 'yes'
        notice(String(true, '%y'))    # Notices 'no'
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
      ```
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======

>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======

>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    DOC
             ) do |arguments|

    unless arguments.size == 1 || arguments.size == 3
      raise(Puppet::ParseError, "bool2str(): Wrong number of arguments given (#{arguments.size} for 3)")
    end

    value = arguments[0]
    true_string = arguments[1] || 'true'
    false_string = arguments[2] || 'false'
    klass = value.class

    # We can have either true or false, and nothing else
    unless [FalseClass, TrueClass].include?(klass)
      raise(Puppet::ParseError, 'bool2str(): Requires a boolean to work with')
    end

    unless [true_string, false_string].all? { |x| x.is_a?(String) }
      raise(Puppet::ParseError, 'bool2str(): Requires strings to convert to')
    end

    return value ? true_string : false_string
  end
end

# vim: set ts=2 sw=2 et :
