#
# getvar.rb
#
module Puppet::Parser::Functions
  newfunction(:getvar, :type => :rvalue, :doc => <<-'DOC') do |args|
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
    Lookup a variable in a given namespace.
    Returns undef if variable does not exist.

    For example:

        $foo = getvar('site::data::foo')
        # Equivalent to $foo = $site::data::foo

    This is useful if the namespace itself is stored in a string:

        $datalocation = 'site::data'
        $bar = getvar("${datalocation}::bar")
        # Equivalent to $bar = $site::data::bar

    Note: from Puppet 6.0.0, the compatible function with the same name in Puppet core
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
    @summary
      Lookup a variable in a given namespace.

    @return
      undef - if variable does not exist

    @example Example usage
      $foo = getvar('site::data::foo') # Equivalent to $foo = $site::data::foo

    @example Where namespace is stored in a string
      $datalocation = 'site::data'
      $bar = getvar("${datalocation}::bar") # Equivalent to $bar = $site::data::bar

    > **Note:** from Puppet 6.0.0, the compatible function with the same name in Puppet core
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    will be used instead of this function. The new function also has support for
    digging into a structured value. See the built-in
    [`getvar`](https://puppet.com/docs/puppet/latest/function.html#getvar) function
    DOC

    unless args.length == 1
      raise Puppet::ParseError, "getvar(): wrong number of arguments (#{args.length}; must be 1)"
    end

    begin
      result = nil
      catch(:undefined_variable) do
        result = lookupvar((args[0]).to_s)
      end

      # avoid relying on inconsistent behaviour around ruby return values from catch
      result
    rescue Puppet::ParseError # rubocop:disable Lint/HandleExceptions : Eat the exception if strict_variables = true is set
    end
  end
end
