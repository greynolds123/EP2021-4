<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# @summary
#   Generates a consistent random string of specific length based on provided seed.
=======
<<<<<<< HEAD
# Generates a consistent random string of specific length based on provided seed.
=======
# @summary
#   Generates a consistent random string of specific length based on provided seed.
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
# Generates a consistent random string of specific length based on provided seed.
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# Generates a consistent random string of specific length based on provided seed.
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
# Generates a consistent random string of specific length based on provided seed.
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
#
# @example Generate a consistently random string of length 8 with a seed:
#   seeded_rand_string(8, "${module_name}::redis_password")
#
# @example Generate a random string from a specific set of characters:
#   seeded_rand_string(5, '', 'abcdef')
Puppet::Functions.create_function(:seeded_rand_string) do
  # @param length Length of string to be generated.
  # @param seed Seed string.
  # @param charset String that contains characters to use for the random string.
  #
  # @return [String] Random string.
  dispatch :rand_string do
    param 'Integer[1]', :length
    param 'String', :seed
    optional_param 'String[2]', :charset
  end

  def rand_string(length, seed, charset = nil)
    require 'digest/sha2'

    charset ||= '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

    random_generator = Random.new(Digest::SHA256.hexdigest(seed).to_i(16))

    Array.new(length) { charset[random_generator.rand(charset.size)] }.join
  end
end
