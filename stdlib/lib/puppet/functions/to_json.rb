<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# Take a data structure and output it as JSON
=======
require 'json'
# @summary
#   Convert a data structure and output to JSON
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
# Take a data structure and output it as JSON
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
# Take a data structure and output it as JSON
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
# @example how to output JSON
#   # output json to a file
#     file { '/tmp/my.json':
#       ensure  => file,
#       content => to_json($myhash),
#     }
#
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
#
require 'json'

Puppet::Functions.create_function(:to_json) do
<<<<<<< HEAD
<<<<<<< HEAD
=======
Puppet::Functions.create_function(:to_json) do
  # @param data
  #   data structure which needs to be converted into JSON
  # @return converted data to json
>>>>>>> 3e0569df506721e4616112328527bfb8431b063a
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  dispatch :to_json do
    param 'Any', :data
  end

  def to_json(data)
    data.to_json
  end
end
