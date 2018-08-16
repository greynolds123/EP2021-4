require 'tempfile'

<<<<<<< HEAD
module Puppet::Parser::Functions
  newfunction(:validate_augeas, :doc => <<-'ENDHEREDOC') do |args|
=======
#
# validate_augaes.rb
#
module Puppet::Parser::Functions
  newfunction(:validate_augeas, :doc => <<-'DOC') do |args|
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    Perform validation of a string using an Augeas lens
    The first argument of this function should be a string to
    test, and the second argument should be the name of the Augeas lens to use.
    If Augeas fails to parse the string with the lens, the compilation will
    abort with a parse error.

    A third argument can be specified, listing paths which should
    not be found in the file. The `$file` variable points to the location
    of the temporary file being tested in the Augeas tree.

    For example, if you want to make sure your passwd content never contains
    a user `foo`, you could write:

        validate_augeas($passwdcontent, 'Passwd.lns', ['$file/foo'])

    Or if you wanted to ensure that no users used the '/bin/barsh' shell,
    you could use:

        validate_augeas($passwdcontent, 'Passwd.lns', ['$file/*[shell="/bin/barsh"]']

    If a fourth argument is specified, this will be the error message raised and
    seen by the user.

    A helpful error message can be returned like this:

        validate_augeas($sudoerscontent, 'Sudoers.lns', [], 'Failed to validate sudoers content with Augeas')

<<<<<<< HEAD
    ENDHEREDOC
    unless Puppet.features.augeas?
      raise Puppet::ParseError, ("validate_augeas(): this function requires the augeas feature. See http://docs.puppetlabs.com/guides/augeas.html#pre-requisites for how to activate it.")
    end

    if (args.length < 2) or (args.length > 4) then
      raise Puppet::ParseError, ("validate_augeas(): wrong number of arguments (#{args.length}; must be 2, 3, or 4)")
=======
    DOC
    unless Puppet.features.augeas?
      raise Puppet::ParseError, 'validate_augeas(): this function requires the augeas feature. See http://docs.puppetlabs.com/guides/augeas.html#pre-requisites for how to activate it.'
    end

    if (args.length < 2) || (args.length > 4)
      raise Puppet::ParseError, "validate_augeas(): wrong number of arguments (#{args.length}; must be 2, 3, or 4)"
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    end

    msg = args[3] || "validate_augeas(): Failed to validate content against #{args[1].inspect}"

    require 'augeas'
<<<<<<< HEAD
    aug = Augeas::open(nil, nil, Augeas::NO_MODL_AUTOLOAD)
=======
    aug = Augeas.open(nil, nil, Augeas::NO_MODL_AUTOLOAD)
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
    begin
      content = args[0]

      # Test content in a temporary file
<<<<<<< HEAD
      tmpfile = Tempfile.new("validate_augeas")
=======
      tmpfile = Tempfile.new('validate_augeas')
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      begin
        tmpfile.write(content)
      ensure
        tmpfile.close
      end

      # Check for syntax
      lens = args[1]
      aug.transform(
        :lens => lens,
        :name => 'Validate_augeas',
<<<<<<< HEAD
        :incl => tmpfile.path
=======
        :incl => tmpfile.path,
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      )
      aug.load!

      unless aug.match("/augeas/files#{tmpfile.path}//error").empty?
        error = aug.get("/augeas/files#{tmpfile.path}//error/message")
        msg += " with error: #{error}"
<<<<<<< HEAD
        raise Puppet::ParseError, (msg)
=======
        raise Puppet::ParseError, msg
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      end

      # Launch unit tests
      tests = args[2] || []
      aug.defvar('file', "/files#{tmpfile.path}")
      tests.each do |t|
        msg += " testing path #{t}"
<<<<<<< HEAD
        raise Puppet::ParseError, (msg) unless aug.match(t).empty?
=======
        raise Puppet::ParseError, msg unless aug.match(t).empty?
>>>>>>> cebd2f908c751349c9576e41139907f4fe36d870
      end
    ensure
      aug.close
      tmpfile.unlink
    end
  end
end
