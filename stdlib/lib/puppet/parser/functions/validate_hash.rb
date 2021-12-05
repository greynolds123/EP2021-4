#
# validate_hash.rb
#
module Puppet::Parser::Functions
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  newfunction(:validate_hash, :doc => <<-'DOC') do |args|
    Validate that all passed values are hash data structures. Abort catalog
    compilation if any value fails this check.

    The following values will pass:

        $my_hash = { 'one' => 'two' }
        validate_hash($my_hash)

    The following values will fail, causing compilation to abort:

        validate_hash(true)
        validate_hash('some_string')
        $undefined = undef
        validate_hash($undefined)

    DOC
<<<<<<< HEAD
<<<<<<< HEAD
=======
  newfunction(:validate_hash, :doc => <<-DOC
    @summary
      Validate that all passed values are hash data structures. Abort catalog
      compilation if any value fails this check.

    @return
      validate hash

    @example **Usage**

      The following values will pass:

          $my_hash = { 'one' => 'two' }
          validate_hash($my_hash)

      The following values will fail, causing compilation to abort:

          validate_hash(true)
          validate_hash('some_string')
          $undefined = undef
          validate_hash($undefined)
    DOC
             ) do |args|
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

    function_deprecation([:validate_hash, 'This method is deprecated, please use the stdlib validate_legacy function,
                          with Stdlib::Compat::Hash. There is further documentation for validate_legacy function in the README.'])

    if args.empty?
      raise Puppet::ParseError, "validate_hash(): wrong number of arguments (#{args.length}; must be > 0)"
    end

    args.each do |arg|
      unless arg.is_a?(Hash)
        raise Puppet::ParseError, "#{arg.inspect} is not a Hash.  It looks to be a #{arg.class}"
      end
    end
  end
end
