<<<<<<< HEAD
=======
<<<<<<< HEAD
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
#
class stdlib {
  include ::stdlib::stages
}
