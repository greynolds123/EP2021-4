#
# values.rb
#
module Puppet::Parser::Functions
  newfunction(:values, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    When given a hash this function will return the values of that hash.

    *Examples:*

        $hash = {
          'a' => 1,
          'b' => 2,
          'c' => 3,
        }
        values($hash)

    This example would return:

        [1,2,3]

    Note: from Puppet 5.5.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
    DOC
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      When given a hash this function will return the values of that hash.

    @return
      array of values

    @example **Usage**
      $hash = {
        'a' => 1,
        'b' => 2,
        'c' => 3,
      }
      values($hash)

      This example would return: ```[1,2,3]```

    > *Note:*
    From Puppet 5.5.0, the compatible function with the same name in Puppet core
    will be used instead of this function.

  DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
             ) do |arguments|

    raise(Puppet::ParseError, "values(): Wrong number of arguments given (#{arguments.size} for 1)") if arguments.empty?

    hash = arguments[0]

    unless hash.is_a?(Hash)
      raise(Puppet::ParseError, 'values(): Requires hash to work with')
    end

    result = hash.values

    return result
  end
end

# vim: set ts=2 sw=2 et :
