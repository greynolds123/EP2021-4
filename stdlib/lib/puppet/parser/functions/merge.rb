#
# merge.rb
#
module Puppet::Parser::Functions
  newfunction(:merge, :type => :rvalue, :doc => <<-'DOC') do |args|
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    Merges two or more hashes together and returns the resulting hash.

    For example:

        $hash1 = {'one' => 1, 'two', => 2}
        $hash2 = {'two' => 'dos', 'three', => 'tres'}
        $merged_hash = merge($hash1, $hash2)
        # The resulting hash is equivalent to:
        # $merged_hash =  {'one' => 1, 'two' => 'dos', 'three' => 'tres'}

    When there is a duplicate key, the key in the rightmost hash will "win."

    Note that since Puppet 4.0.0 the same merge can be achieved with the + operator.

        $merged_hash = $hash1 + $hash2
<<<<<<< HEAD
=======
    @summary
      Merges two or more hashes together and returns the resulting hash.

    @example **Usage**
      $hash1 = {'one' => 1, 'two', => 2}
      $hash2 = {'two' => 'dos', 'three', => 'tres'}
      $merged_hash = merge($hash1, $hash2) # $merged_hash =  {'one' => 1, 'two' => 'dos', 'three' => 'tres'}

    When there is a duplicate key, the key in the rightmost hash will "win."

    @return [Hash]
      The merged hash

    Note that since Puppet 4.0.0 the same merge can be achieved with the + operator.
      `$merged_hash = $hash1 + $hash2`
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    DOC

    if args.length < 2
      raise Puppet::ParseError, "merge(): wrong number of arguments (#{args.length}; must be at least 2)"
    end

    # The hash we accumulate into
    accumulator = {}
    # Merge into the accumulator hash
    args.each do |arg|
      next if arg.is_a?(String) && arg.empty? # empty string is synonym for puppet's undef
      unless arg.is_a?(Hash)
        raise Puppet::ParseError, "merge: unexpected argument type #{arg.class}, only expects hash arguments"
      end
      accumulator.merge!(arg)
    end
    # Return the fully merged hash
    accumulator
  end
end
