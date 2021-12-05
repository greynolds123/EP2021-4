#
# pry.rb
#
module Puppet::Parser::Functions
  newfunction(:pry, :type => :statement, :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    This function invokes a pry debugging session in the current scope object. This is useful for debugging manifest code at specific points during a compilation.

    *Examples:*

        pry()
<<<<<<< HEAD
=======
    @summary
      This function invokes a pry debugging session in the current scope object.
    This is useful for debugging manifest code at specific points during a compilation.

    @return
      debugging information

    @example **Usage**

      `pry()`

>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    DOC
             ) do |arguments|
    begin
      require 'pry'
    rescue LoadError
      raise(Puppet::Error, "pry(): Requires the 'pry' rubygem to use, but it was not found")
    end
    #
    ## Run `catalog` to see the contents currently compiling catalog
    ## Run `cd catalog` and `ls` to see catalog methods and instance variables
    ## Run `@resource_table` to see the current catalog resource table
    #
    if $stdout.isatty
      binding.pry # rubocop:disable Lint/Debugger
    else
      Puppet.warning 'pry(): cowardly refusing to start the debugger on a daemonized master'
    end
  end
end
