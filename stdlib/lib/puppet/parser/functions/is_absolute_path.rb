<<<<<<< HEAD
module Puppet::Parser::Functions
  newfunction(:is_absolute_path, :type => :rvalue, :arity => 1, :doc => <<-'ENDHEREDOC') do |args|
=======
#
# is_absolute_path.rb
#
module Puppet::Parser::Functions
  newfunction(:is_absolute_path, :type => :rvalue, :arity => 1, :doc => <<-'DOC') do |args|
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    Returns boolean true if the string represents an absolute path in the filesystem.  This function works
    for windows and unix style paths.

    The following values will return true:

        $my_path = 'C:/Program Files (x86)/Puppet Labs/Puppet'
        is_absolute_path($my_path)
        $my_path2 = '/var/lib/puppet'
        is_absolute_path($my_path2)
        $my_path3 = ['C:/Program Files (x86)/Puppet Labs/Puppet']
        is_absolute_path($my_path3)
        $my_path4 = ['/var/lib/puppet']
        is_absolute_path($my_path4)

    The following values will return false:

        is_absolute_path(true)
        is_absolute_path('../var/lib/puppet')
        is_absolute_path('var/lib/puppet')
        $undefined = undef
        is_absolute_path($undefined)

<<<<<<< HEAD
  ENDHEREDOC
    function_deprecation([:is_absolute_path, 'This method is deprecated, please use the stdlib validate_legacy function, with Stdlib::Compat::Absolute_path. There is further documentation for validate_legacy function in the README.'])
=======
  DOC
    function_deprecation([:is_absolute_path, 'This method is deprecated, please use the stdlib validate_legacy function,
                           with Stdlib::Compat::Absolute_path. There is further documentation for validate_legacy function in the README.'])
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    require 'puppet/util'

    path = args[0]
    # This logic was borrowed from
    # [lib/puppet/file_serving/base.rb](https://github.com/puppetlabs/puppet/blob/master/lib/puppet/file_serving/base.rb)
    # Puppet 2.7 and beyond will have Puppet::Util.absolute_path? Fall back to a back-ported implementation otherwise.
<<<<<<< HEAD
    if Puppet::Util.respond_to?(:absolute_path?) then
      value = (Puppet::Util.absolute_path?(path, :posix) or Puppet::Util.absolute_path?(path, :windows))
=======
    if Puppet::Util.respond_to?(:absolute_path?)
      value = (Puppet::Util.absolute_path?(path, :posix) || Puppet::Util.absolute_path?(path, :windows))
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    else
      # This code back-ported from 2.7.x's lib/puppet/util.rb Puppet::Util.absolute_path?
      # Determine in a platform-specific way whether a path is absolute. This
      # defaults to the local platform if none is specified.
      # Escape once for the string literal, and once for the regex.
      slash = '[\\\\/]'
      name = '[^\\\\/]+'
      regexes = {
<<<<<<< HEAD
        :windows => %r!^(([A-Z]:#{slash})|(#{slash}#{slash}#{name}#{slash}#{name})|(#{slash}#{slash}\?#{slash}#{name}))!i,
        :posix => %r!^/!
      }
      value = (!!(path =~ regexes[:posix])) || (!!(path =~ regexes[:windows]))
=======
        :windows => %r{^(([A-Z]:#{slash})|(#{slash}#{slash}#{name}#{slash}#{name})|(#{slash}#{slash}\?#{slash}#{name}))}i,
        :posix => %r{^/},
      }
      value = !!(path =~ regexes[:posix]) || !!(path =~ regexes[:windows]) # rubocop:disable Style/DoubleNegation : No alternative known
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end
    value
  end
end
