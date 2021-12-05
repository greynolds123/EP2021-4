<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Take a data structure and output it as YAML
=======
require 'yaml'
# @summary
#   Convert a data structure and output it as YAML
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
# Take a data structure and output it as YAML
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# Take a data structure and output it as YAML
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
# @example how to output YAML
#   # output yaml to a file
#     file { '/tmp/my.yaml':
#       ensure  => file,
#       content => to_yaml($myhash),
#     }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
#
require 'yaml'

Puppet::Functions.create_function(:to_yaml) do
<<<<<<< HEAD
<<<<<<< HEAD
=======
Puppet::Functions.create_function(:to_yaml) do
  # @param data
  #
  # @return [String]
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  dispatch :to_yaml do
    param 'Any', :data
  end

  def to_yaml(data)
    data.to_yaml
  end
end
