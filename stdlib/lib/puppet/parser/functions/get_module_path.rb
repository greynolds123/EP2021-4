#
# get_module_path.rb
#
module Puppet::Parser::Functions
  newfunction(:get_module_path, :type => :rvalue, :doc => <<-DOC
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    Returns the absolute path of the specified module for the current
    environment.

    Example:
      $module_path = get_module_path('stdlib')
<<<<<<< HEAD

    Note that since Puppet 5.4.0 the function `module_directory()` in Puppet does the same thing and will return
    the path to the first found module if given multiple values or an array.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Returns the absolute path of the specified module for the current
      environment.

    @return
      Returns the absolute path of the specified module for the current
      environment.

    @example Example Usage:
      $module_path = get_module_path('stdlib')

    > *Note:*
      that since Puppet 5.4.0 the  built-in
      [`module_directory`](https://puppet.com/docs/puppet/latest/function.html#module_directory)
      function in Puppet does the same thing and will return the path to the first found module
      if given multiple values or an array.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  DOC
             ) do |args|
    raise(Puppet::ParseError, 'get_module_path(): Wrong number of arguments, expects one') unless args.size == 1
    module_path = Puppet::Module.find(args[0], compiler.environment.to_s)
    raise(Puppet::ParseError, "Could not find module #{args[0]} in environment #{compiler.environment}") unless module_path
    module_path.path
  end
end
