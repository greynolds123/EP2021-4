#
# type.rb
#
module Puppet::Parser::Functions
  newfunction(:type, :type => :rvalue, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    DEPRECATED: This function will cease to function on Puppet 4; please use type3x() before upgrading to Puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.
=======
    @summary
      **DEPRECATED:** This function will cease to function on Puppet 4;
     please use type3x() before upgrading to Puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.

    @return the type when passed a value. Type can be one of:

    * string
    * array
    * hash
    * float
    * integer
    * boolean
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    DEPRECATED: This function will cease to function on Puppet 4; please use type3x() before upgrading to Puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    DEPRECATED: This function will cease to function on Puppet 4; please use type3x() before upgrading to Puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
    DEPRECATED: This function will cease to function on Puppet 4; please use type3x() before upgrading to Puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
    DEPRECATED: This function will cease to function on Puppet 4; please use type3x() before upgrading to puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |args|

    warning("type() DEPRECATED: This function will cease to function on Puppet 4; please use type3x() before upgrading to puppet 4 for backwards-compatibility, or migrate to the new parser's typing system.") # rubocop:disable Metrics/LineLength : Cannot reduce line length
    unless Puppet::Parser::Functions.autoloader.loaded?(:type3x)
      Puppet::Parser::Functions.autoloader.load(:type3x)
    end
    function_type3x(args)
  end
end

# vim: set ts=2 sw=2 et :
