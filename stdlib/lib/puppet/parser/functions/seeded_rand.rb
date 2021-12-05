#
# seeded_rand.rb
#
Puppet::Parser::Functions.newfunction(
  :seeded_rand,
  :arity => 2,
  :type => :rvalue,
  :doc => <<-DOC
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Usage: `seeded_rand(MAX, SEED)`. MAX must be a positive integer; SEED is any string.
=======
    @summary
      Generates a random whole number greater than or equal to 0 and less than MAX, using the value of SEED for repeatable randomness.

    @return
      random number greater than or equal to 0 and less than MAX

    @example **Usage:**
      seeded_rand(MAX, SEED).
      MAX must be a positive integer; SEED is any string.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
    Usage: `seeded_rand(MAX, SEED)`. MAX must be a positive integer; SEED is any string.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
    Usage: `seeded_rand(MAX, SEED)`. MAX must be a positive integer; SEED is any string.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

    Generates a random whole number greater than or equal to 0 and less
    than MAX, using the value of SEED for repeatable randomness.  If SEED
    starts with "$fqdn:", this is behaves the same as `fqdn_rand`.
DOC
) do |args|
  require 'digest/md5'

  raise(ArgumentError, 'seeded_rand(): first argument must be a positive integer') unless function_is_integer([args[0]]) && args[0].to_i > 0
  raise(ArgumentError, 'seeded_rand(): second argument must be a string') unless args[1].is_a? String

  max = args[0].to_i
  seed = Digest::MD5.hexdigest(args[1]).hex
  Puppet::Util.deterministic_rand(seed, max)
end
