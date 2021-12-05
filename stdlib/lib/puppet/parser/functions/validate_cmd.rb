require 'puppet/util/execution'
require 'tempfile'

#
# validate_cmd.rb
#
module Puppet::Parser::Functions
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  newfunction(:validate_cmd, :doc => <<-'DOC') do |args|
    Perform validation of a string with an external command.
=======
  newfunction(:validate_cmd, :doc => <<-DOC
    @summary
      Perform validation of a string with an external command.

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
  newfunction(:validate_cmd, :doc => <<-'DOC') do |args|
    Perform validation of a string with an external command.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  newfunction(:validate_cmd, :doc => <<-'DOC') do |args|
    Perform validation of a string with an external command.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
  newfunction(:validate_cmd, :doc => <<-'DOC') do |args|
    Perform validation of a string with an external command.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    The first argument of this function should be a string to
    test, and the second argument should be a path to a test command
    taking a % as a placeholder for the file path (will default to the end).
    If the command, launched against a tempfile containing the passed string,
    returns a non-null value, compilation will abort with a parse error.
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

    If a third argument is specified, this will be the error message raised and
    seen by the user.

    A helpful error message can be returned like this:

    Example:

        # Defaults to end of path
        validate_cmd($sudoerscontent, '/usr/sbin/visudo -c -f', 'Visudo failed to validate sudoers content')

        # % as file location
        validate_cmd($haproxycontent, '/usr/sbin/haproxy -f % -c', 'Haproxy failed to validate config content')

    DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    If a third argument is specified, this will be the error message raised and
    seen by the user.

    @return
      validate of a string with an external command

    A helpful error message can be returned like this:

    @example **Usage**

      Defaults to end of path
        validate_cmd($sudoerscontent, '/usr/sbin/visudo -c -f', 'Visudo failed to validate sudoers content')

      % as file location
        validate_cmd($haproxycontent, '/usr/sbin/haproxy -f % -c', 'Haproxy failed to validate config content')

    DOC
             ) do |args|
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    if (args.length < 2) || (args.length > 3)
      raise Puppet::ParseError, "validate_cmd(): wrong number of arguments (#{args.length}; must be 2 or 3)"
    end

    msg = args[2] || "validate_cmd(): failed to validate content with command #{args[1].inspect}"

    content = args[0]
    checkscript = args[1]

    # Test content in a temporary file
    tmpfile = Tempfile.new('validate_cmd')
    begin
      tmpfile.write(content)
      tmpfile.close

      check_with_correct_location = if checkscript =~ %r{\s%(\s|$)}
                                      checkscript.gsub(%r{%}, tmpfile.path)
                                    else
                                      "#{checkscript} #{tmpfile.path}"
                                    end

      if Puppet::Util::Execution.respond_to?('execute')
        Puppet::Util::Execution.execute(check_with_correct_location)
      else
        Puppet::Util.execute(check_with_correct_location)
      end
    rescue Puppet::ExecutionFailure => detail
      msg += "\n#{detail}"
      raise Puppet::ParseError, msg
    rescue StandardError => detail
      msg += "\n#{detail.class.name} #{detail}"
      raise Puppet::ParseError, msg
    ensure
      tmpfile.unlink
    end
  end
end
