#
# assert_private.rb
#
module Puppet::Parser::Functions
  newfunction(:assert_private, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Sets the current class or definition as private.
=======
    @summary
      Sets the current class or definition as private.

    @return
      set the current class or definition as private.

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Sets the current class or definition as private.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Sets the current class or definition as private.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    Sets the current class or definition as private.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    Calling the class or definition from outside the current module will fail.
    DOC
             ) do |args|

    raise(Puppet::ParseError, "assert_private(): Wrong number of arguments given (#{args.size}}) for 0 or 1)") if args.size > 1

    scope = self
    if scope.lookupvar('module_name') != scope.lookupvar('caller_module_name')
      message = nil
      if args[0] && args[0].is_a?(String)
        message = args[0]
      else
        manifest_name = scope.source.name
        manifest_type = scope.source.type
        message = (manifest_type.to_s == 'hostclass') ? 'Class' : 'Definition'
        message += " #{manifest_name} is private"
      end
      raise(Puppet::ParseError, message)
    end
  end
end
