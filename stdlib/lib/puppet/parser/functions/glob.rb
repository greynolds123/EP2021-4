#
#  glob.rb
#
module Puppet::Parser::Functions
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  newfunction(:glob, :type => :rvalue, :doc => <<-'DOC'
    Returns an Array of file entries of a directory or an Array of directories.
    Uses same patterns as Dir#glob
=======
  newfunction(:glob, :type => :rvalue, :doc => <<-DOC
    @summary
      Uses same patterns as Dir#glob.

    @return
      Returns an Array of file entries of a directory or an Array of directories.

    @example Example Usage:
      $confs = glob(['/etc/**/*.conf', '/opt/**/*.conf'])
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
  newfunction(:glob, :type => :rvalue, :doc => <<-'DOC'
    Returns an Array of file entries of a directory or an Array of directories.
    Uses same patterns as Dir#glob
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  newfunction(:glob, :type => :rvalue, :doc => <<-'DOC'
    Returns an Array of file entries of a directory or an Array of directories.
    Uses same patterns as Dir#glob
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
  newfunction(:glob, :type => :rvalue, :doc => <<-'DOC'
    Returns an Array of file entries of a directory or an Array of directories.
    Uses same patterns as Dir#glob
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    DOC
             ) do |arguments|

    unless arguments.size == 1
      raise(Puppet::ParseError, 'glob(): Wrong number of arguments given ' \
        "(#{arguments.size} for 1)")
    end

    pattern = arguments[0]

    unless pattern.is_a?(String) || pattern.is_a?(Array)
      raise(Puppet::ParseError, 'glob(): Requires either array or string ' \
        'to work')
    end

    Dir.glob(pattern)
  end
end
