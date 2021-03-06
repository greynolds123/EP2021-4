<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
# Merges two or more hashes together or hashes resulting from iteration, and returns the resulting hash.
#
# @example Using merge()
#
#   $hash1 = {'one' => 1, 'two', => 2}
#   $hash2 = {'two' => 'dos', 'three', => 'tres'}
#   $merged_hash = merge($hash1, $hash2)
#   # The resulting hash is equivalent to:
#   # $merged_hash =  {'one' => 1, 'two' => 'dos', 'three' => 'tres'}
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
# @summary
#   Merges two or more hashes together or hashes resulting from iteration, and returns
#   the resulting hash.
#
# @example Using merge()
#   $hash1 = {'one' => 1, 'two', => 2}
#   $hash2 = {'two' => 'dos', 'three', => 'tres'}
#   $merged_hash = merge($hash1, $hash2) # $merged_hash =  {'one' => 1, 'two' => 'dos', 'three' => 'tres'}
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
#
# When there is a duplicate key, the key in the rightmost hash will "win."
#
# Note that since Puppet 4.0.0 the same merge can be achieved with the + operator.
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#  `$merged_hash = $hash1 + $hash2`
=======
<<<<<<< HEAD
#
#    $merged_hash = $hash1 + $hash2
=======
#  `$merged_hash = $hash1 + $hash2`
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
#
#    $merged_hash = $hash1 + $hash2
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
#
#    $merged_hash = $hash1 + $hash2
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
#
#    $merged_hash = $hash1 + $hash2
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
#
# If merge is given a single Iterable (Array, Hash, etc.) it will call a given block with
# up to three parameters, and merge each resulting Hash into the accumulated result. All other types
# of values returned from the block (typically undef) are skipped (not merged).
#
# The codeblock can take 2 or three parameters:
# * with two, it gets the current hash (as built to this point), and each value (for hash the value is a [key, value] tuple)
# * with three, it gets the current hash (as built to this point), the key/index of each value, and then the value
#
# If the iterable is empty, or no hash was returned from the given block, an empty hash is returned. In the given block, a call to `next()`
# will skip that entry, and a call to `break()` will end the iteration.
#
# @example counting occurrences of strings in an array
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
#   ['a', 'b', 'c', 'c', 'd', 'b'].merge | $hsh, $v | { { $v => $hsh[$v].lest || { 0 } + 1 } }
#   # would result in { a => 1, b => 2, c => 2, d => 1 }
#
# @example skipping values for entries that are longer than 1 char
#   ['a', 'b', 'c', 'c', 'd', 'b', 'blah', 'blah'].merge | $hsh, $v | { if $v =~ String[1,1] { { $v => $hsh[$v].lest || { 0 } + 1 } } }
#   # would result in { a => 1, b => 2, c => 2, d => 1 } since 'blah' is longer than 2 chars
#
# The iterative `merge()` has an advantage over doing the same with a general `reduce()` in that the constructed hash
# does not have to be copied in each iteration and thus will perform much better with large inputs.
#
Puppet::Functions.create_function(:merge) do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
#   ['a', 'b', 'c', 'c', 'd', 'b'].merge | $hsh, $v | { { $v => $hsh[$v].lest || { 0 } + 1 } } # results in { a => 1, b => 2, c => 2, d => 1 }
#
# @example skipping values for entries that are longer than 1 char
#   ['a', 'b', 'c', 'c', 'd', 'b', 'blah', 'blah'].merge | $hsh, $v | { if $v =~ String[1,1] { { $v => $hsh[$v].lest || { 0 } + 1 } } } # results in { a => 1, b => 2, c => 2, d => 1 }
#
# The iterative `merge()` has an advantage over doing the same with a general `reduce()` in that the constructed hash
# does not have to be copied in each iteration and thus will perform much better with large inputs.
Puppet::Functions.create_function(:merge) do
  # @param args
  #   Repeated Param - The hashes that are to be merged
  #
  # @return
  #   The merged hash
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :merge2hashes do
    repeated_param 'Variant[Hash, Undef, String[0,0]]', :args # this strange type is backwards compatible
    return_type 'Hash'
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  # @param args
  #   Repeated Param - The hashes that are to be merged
  #
  # @param block
  #   A block placed on the repeatable param `args`
  #
  # @return
  #   The merged hash
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :merge_iterable3 do
    repeated_param 'Iterable', :args
    block_param 'Callable[3,3]', :block
    return_type 'Hash'
  end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  # @param args
  #   Repeated Param - The hashes that are to be merged
  #
  # @param block
  #   A block placed on the repeatable param `args`
  #
  # @return
  #   The merged hash
<<<<<<< HEAD
=======
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  dispatch :merge_iterable2 do
    repeated_param 'Iterable', :args
    block_param 'Callable[2,2]', :block
    return_type 'Hash'
  end

  def merge2hashes(*hashes)
    accumulator = {}
    hashes.each { |h| accumulator.merge!(h) if h.is_a?(Hash) }
    accumulator
  end

  def merge_iterable2(iterable)
    accumulator = {}
    enum = Puppet::Pops::Types::Iterable.asserted_iterable(self, iterable)
    enum.each do |v|
      r = yield(accumulator, v)
      accumulator.merge!(r) if r.is_a?(Hash)
    end
    accumulator
  end

  def merge_iterable3(iterable)
    accumulator = {}
    enum = Puppet::Pops::Types::Iterable.asserted_iterable(self, iterable)
    if enum.hash_style?
      enum.each do |entry|
        r = yield(accumulator, *entry)
        accumulator.merge!(r) if r.is_a?(Hash)
      end
    else
      begin
        index = 0
        loop do
          r = yield(accumulator, index, enum.next)
          accumulator.merge!(r) if r.is_a?(Hash)
          index += 1
        end
      rescue StopIteration # rubocop:disable Lint/HandleExceptions
      end
    end
    accumulator
  end
end
