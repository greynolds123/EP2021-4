#
# private.rb
#
module Puppet::Parser::Functions
  newfunction(:private, :doc => <<-'DOC'
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    DEPRECATED: Sets the current class or definition as private.
    Calling the class or definition from outside the current module will fail.
=======
   @summary
    **Deprecated:** Sets the current class or definition as private.
    Calling the class or definition from outside the current module will fail.

   @return
      Sets the current class or definition as private
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    DEPRECATED: Sets the current class or definition as private.
    Calling the class or definition from outside the current module will fail.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    DEPRECATED: Sets the current class or definition as private.
    Calling the class or definition from outside the current module will fail.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    DEPRECATED: Sets the current class or definition as private.
    Calling the class or definition from outside the current module will fail.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    DEPRECATED: Sets the current class or definition as private.
    Calling the class or definition from outside the current module will fail.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |args|
    warning("private() DEPRECATED: This function will cease to function on Puppet 4; please use assert_private() before upgrading to puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.") # rubocop:disable Metrics/LineLength : Cannot shorten this line
    unless Puppet::Parser::Functions.autoloader.loaded?(:assert_private)
      Puppet::Parser::Functions.autoloader.load(:assert_private)
    end
    function_assert_private([(args[0] unless args.empty?)])
  end
end
