<<<<<<< HEAD
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
# Class: stdlib
#
# This module manages stdlib. Most of stdlib's features are automatically
# loaded by Puppet, but this class should be declared in order to use the
# standardized run stages.
#
# Parameters: none
#
# Actions:
#
#   Declares all other classes in the stdlib module. Currently, this consists
#   of stdlib::stages.
#
# Requires: nothing
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
# @summary
#   This module manages stdlib.
# 
# Most of stdlib's features are automatically loaded by Puppet, but this class should be 
# declared in order to use the standardized run stages.
# 
# Declares all other classes in the stdlib module. Currently, this consists
# of stdlib::stages.
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
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
#
class stdlib {
  include ::stdlib::stages
}
