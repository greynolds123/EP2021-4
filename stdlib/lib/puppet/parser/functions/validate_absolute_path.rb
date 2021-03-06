#
# validate_absolute_path.rb
#
module Puppet::Parser::Functions
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
  newfunction(:validate_absolute_path, :doc => <<-'DOC') do |args|
    Validate the string represents an absolute path in the filesystem.  This function works
    for windows and unix style paths.

    The following values will pass:

        $my_path = 'C:/Program Files (x86)/Puppet Labs/Puppet'
        validate_absolute_path($my_path)
        $my_path2 = '/var/lib/puppet'
        validate_absolute_path($my_path2)
        $my_path3 = ['C:/Program Files (x86)/Puppet Labs/Puppet','C:/Program Files/Puppet Labs/Puppet']
        validate_absolute_path($my_path3)
        $my_path4 = ['/var/lib/puppet','/usr/share/puppet']
        validate_absolute_path($my_path4)

    The following values will fail, causing compilation to abort:

        validate_absolute_path(true)
        validate_absolute_path('../var/lib/puppet')
        validate_absolute_path('var/lib/puppet')
        validate_absolute_path([ 'var/lib/puppet', '/var/foo' ])
        validate_absolute_path([ '/var/lib/puppet', 'var/foo' ])
        $undefined = undef
        validate_absolute_path($undefined)

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:validate_absolute_path, :doc => <<-DOC) do |args|
    @summary
      Validate the string represents an absolute path in the filesystem.  This function works
      for windows and unix style paths.

    @return
      passes when the string is an absolute path or raise an error when it is not and fails compilation

    @example **Usage**

      The following values will pass:

          $my_path = 'C:/Program Files (x86)/Puppet Labs/Puppet'
          validate_absolute_path($my_path)
          $my_path2 = '/var/lib/puppet'
          validate_absolute_path($my_path2)
          $my_path3 = ['C:/Program Files (x86)/Puppet Labs/Puppet','C:/Program Files/Puppet Labs/Puppet']
          validate_absolute_path($my_path3)
          $my_path4 = ['/var/lib/puppet','/usr/share/puppet']
          validate_absolute_path($my_path4)

      The following values will fail, causing compilation to abort:

          validate_absolute_path(true)
          validate_absolute_path('../var/lib/puppet')
          validate_absolute_path('var/lib/puppet')
          validate_absolute_path([ 'var/lib/puppet', '/var/foo' ])
          validate_absolute_path([ '/var/lib/puppet', 'var/foo' ])
          $undefined = undef
          validate_absolute_path($undefined)
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

    require 'puppet/util'

    if args.empty?
      raise Puppet::ParseError, "validate_absolute_path(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      # put arg to candidate var to be able to replace it
      candidates = arg
      # if arg is just a string with a path to test, convert it to an array
      # to avoid test code duplication
      unless arg.is_a?(Array)
        candidates = Array.new(1, arg)
      end
      # iterate over all paths within the candidates array
      candidates.each do |path|
        unless function_is_absolute_path([path])
          raise Puppet::ParseError, "#{path.inspect} is not an absolute path."
        end
      end
    end
  end
end
