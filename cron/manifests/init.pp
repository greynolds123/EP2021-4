# == Class:cron
<<<<<<< HEAD
#
# Full description of class cron here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cron:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#

class cron {
   include cron::config
   include cron::mc_cron
}

<<<<<<< HEAD
=======
=======
#
# Full description of class cron here.	:wq!
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { cron:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# == Authors
#
# Author Name <author@domain.com>
#
#
# Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
>>>>>>> 880be5e986d2a2411d16e0a903069a072d0916d0

class cron {
   include cron::config
   include cron::mc_cron
}

<<<<<<< HEAD
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======

>>>>>>> 880be5e986d2a2411d16e0a903069a072d0916d0
