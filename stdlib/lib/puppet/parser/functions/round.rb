#
# round.rb
#
module Puppet::Parser::Functions
  newfunction(:round, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    Rounds a number to the nearest integer

    *Examples:*

    round(2.9)

    returns: 3

    round(2.4)

    returns: 2

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
    will be used instead of this function.
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Rounds a number to the nearest integer

    @return
      the rounded value as integer

    @example

    ```round(2.9)``` returns ```3```

    ```round(2.4)``` returns ```2```

    > *Note:* from Puppet 6.0.0, the compatible function with the same name in Puppet core
      will be used instead of this function.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  DOC
             ) do |args|

    raise Puppet::ParseError, "round(): Wrong number of arguments given #{args.size} for 1" if args.size != 1
    raise Puppet::ParseError, "round(): Expected a Numeric, got #{args[0].class}" unless args[0].is_a? Numeric

    value = args[0]

    if value >= 0
      Integer(value + 0.5)
    else
      Integer(value - 0.5)
    end
  end
end
