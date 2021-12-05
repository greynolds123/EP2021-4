#
# fqdn_rotate.rb
#
Puppet::Parser::Functions.newfunction(
  :fqdn_rotate,
  :type => :rvalue,
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
  :doc => "Usage: `fqdn_rotate(VALUE, [SEED])`. VALUE is required and
  must be an array or a string. SEED is optional and may be any number
  or string.

  Rotates VALUE a random number of times, combining the `$fqdn` fact and
  the value of SEED for repeatable randomness. (That is, each node will
  get a different random rotation from this function, but a given node's
  result will be the same every time unless its hostname changes.) Adding
  a SEED can be useful if you need more than one unrelated rotation.",
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
  :doc => <<-DOC
  @summary
    Rotates an array or string a random number of times, combining the `$fqdn` fact
    and an optional seed for repeatable randomness.

  @return
    rotated array or string

  @example Example Usage:
    fqdn_rotate(['a', 'b', 'c', 'd'])
    fqdn_rotate('abcd')
    fqdn_rotate([1, 2, 3], 'custom seed')
  DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
) do |args|

  raise(Puppet::ParseError, "fqdn_rotate(): Wrong number of arguments given (#{args.size} for 1)") if args.empty?

  value = args.shift
  require 'digest/md5'

  unless value.is_a?(Array) || value.is_a?(String)
    raise(Puppet::ParseError, 'fqdn_rotate(): Requires either array or string to work with')
  end

  result = value.clone

  string = value.is_a?(String) ? true : false

  # Check whether it makes sense to rotate ...
  return result if result.size <= 1

  # We turn any string value into an array to be able to rotate ...
  result = string ? result.split('') : result

  elements = result.size

  seed = Digest::MD5.hexdigest([lookupvar('::fqdn'), args].join(':')).hex
  # deterministic_rand() was added in Puppet 3.2.0; reimplement if necessary
  if Puppet::Util.respond_to?(:deterministic_rand)
    offset = Puppet::Util.deterministic_rand(seed, elements).to_i
  else
    return offset = Random.new(seed).rand(elements) if defined?(Random) == 'constant' && Random.class == Class

    old_seed = srand(seed)
    offset = rand(elements)
    srand(old_seed)
  end
  offset.times do
    result.push result.shift
  end

  result = string ? result.join : result

  return result
end

# vim: set ts=2 sw=2 et :
