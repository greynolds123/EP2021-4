#
# reject.rb
#
module Puppet::Parser::Functions
  newfunction(:reject, :type => :rvalue, :doc => <<-DOC) do |args|
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    This function searches through an array and rejects all elements that match
    the provided regular expression.

    *Examples:*

        reject(['aaa','bbb','ccc','aaaddd'], 'aaa')

    Would return:

        ['bbb','ccc']

    Note that since Puppet 4.0.0 the same is in general done with the filter function. Here is the
    equivalence of the reject() function:

        ['aaa','bbb','ccc','aaaddd'].filter |$x| { $x !~ /aaa/ }
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      This function searches through an array and rejects all elements that match
      the provided regular expression.

    @return
      an array containing all the elements which doesn'' match the provided regular expression

    @example **Usage**

      reject(['aaa','bbb','ccc','aaaddd'], 'aaa')

      Would return: ['bbb','ccc']

    > *Note:*
    Since Puppet 4.0.0 the same is in general done with the filter function. Here is the equivalence of the reject() function:
    ['aaa','bbb','ccc','aaaddd'].filter |$x| { $x !~ /aaa/ }
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
DOC

    if args.size != 2
      raise Puppet::ParseError,
            "reject(): Wrong number of arguments given #{args.size} for 2"
    end

    ary = args[0]
    pattern = Regexp.new(args[1])

    ary.reject { |e| e =~ pattern }
  end
end

# vim: set ts=2 sw=2 et :
