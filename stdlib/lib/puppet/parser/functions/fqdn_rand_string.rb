Puppet::Parser::Functions.newfunction(
  :fqdn_rand_string,
  :arity => -2,
  :type => :rvalue,
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  :doc => "Usage: `fqdn_rand_string(LENGTH, [CHARSET], [SEED])`. LENGTH is
  required and must be a positive integer. CHARSET is optional and may be
  `undef` or a string. SEED is optional and may be any number or string.

  Generates a random string LENGTH characters long using the character set
  provided by CHARSET, combining the `$fqdn` fact and the value of SEED for
  repeatable randomness. (That is, each node will get a different random
  string from this function, but a given node's result will be the same every
  time unless its hostname changes.) Adding a SEED can be useful if you need
  more than one unrelated string. CHARSET will default to alphanumeric if
  `undef` or an empty string.",
<<<<<<< HEAD
<<<<<<< HEAD
=======
  :doc => <<-DOC
  @summary
    Generates a random alphanumeric string. Combining the `$fqdn` fact and an
    optional seed for repeatable randomness.

  Optionally, you can specify a character set for the function (defaults to alphanumeric).

  Arguments
  * An integer, specifying the length of the resulting string.
  * Optionally, a string specifying the character set.
  * Optionally, a string specifying the seed for repeatable randomness.

  @return [String]

  @example Example Usage:
    fqdn_rand_string(10)
    fqdn_rand_string(10, 'ABCDEF!@$%^')
    fqdn_rand_string(10, '', 'custom seed')
  DOC
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
) do |args|
  raise(ArgumentError, 'fqdn_rand_string(): wrong number of arguments (0 for 1)') if args.empty?
  Puppet::Parser::Functions.function('is_integer')
  raise(ArgumentError, 'fqdn_rand_string(): first argument must be a positive integer') unless function_is_integer([args[0]]) && args[0].to_i > 0
  raise(ArgumentError, 'fqdn_rand_string(): second argument must be undef or a string') unless args[1].nil? || args[1].is_a?(String)

  Puppet::Parser::Functions.function('fqdn_rand')

  length = args.shift.to_i
  charset = args.shift.to_s.chars.to_a

  charset = (0..9).map { |i| i.to_s } + ('A'..'Z').to_a + ('a'..'z').to_a if charset.empty?

  rand_string = ''
  for current in 1..length # rubocop:disable Style/For : An each loop would not work correctly in this circumstance
    rand_string << charset[function_fqdn_rand([charset.size, (args + [current.to_s]).join(':')]).to_i]
  end

  rand_string
end
