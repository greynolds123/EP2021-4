<<<<<<< HEAD
<<<<<<< HEAD
[![Puppet Forge](https://img.shields.io/puppetforge/v/theforeman/puppet.svg)](https://forge.puppetlabs.com/theforeman/puppet)
[![Build Status](https://travis-ci.org/theforeman/puppet-puppet.svg?branch=master)](https://travis-ci.org/theforeman/puppet-puppet)

# Puppet module for installing the Puppet agent and master

Installs and configures the Puppet agent and optionally a Puppet master (when
`server` is true).  Part of the [Foreman installer](https://github.com/theforeman/foreman-installer)
or to be used as a Puppet module.

When using Puppet Server (version 5.3.6 is the lowest version, this module supports),
the module supports and assumes you will be installing the latest version.
If you know you'll be installing an earlier or specific version, you will
need to override `server_puppetserver_version`. More information in the Puppet
Server section below.

Many puppet.conf options for agents, masters and other are parameterized, with
class documentation provided at the top of the manifests. In addition, there
are hash parameters for each configuration section that can be used to supply
any options that are not explicitly supported.

## Environments support

The module helps configure Puppet environments using directory environments.
These are set up under /etc/puppetlabs/code/environments.

## Git repo support

Environments can be backed by git by setting `server_git_repo` to true, which
sets up `/var/lib/puppet/puppet.git` where each branch maps to one environment.
Avoid using 'master' as this name isn't permitted.  On each push to the repo, a
hook updates `/etc/puppet/environments` with the contents of the branch.

Requires [theforeman/git](https://forge.puppetlabs.com/theforeman/git).

## Foreman integration

With the 3.0.0 release the Foreman integration became optional.  It will still
by default install the Foreman integration when `server` is true,
so if you wish to run a Puppet master without Foreman, it can be disabled by
setting `server_foreman` to false.

Requires [theforeman/foreman](https://forge.puppetlabs.com/theforeman/foreman).

## PuppetDB integration

The Puppet master can be configured to export catalogs and reports to a
PuppetDB instance, using the puppetlabs/puppetdb module.  Use its
`puppetdb::server` class to install the PuppetDB server and this module to
configure the Puppet master to connect to PuppetDB.

Requires [puppetlabs/puppetdb](https://forge.puppetlabs.com/puppetlabs/puppetdb)

Please see the notes about using puppetlabs/puppetdb 5.x with older versions of Puppet (< 4.x) and PuppetDB (< 3.x) with
newer releases of the module and set the values via hiera or an extra include of `puppetdb::globals` with
`puppetdb_version` defined.

# Installation

Available from GitHub (via cloning or tarball), [Puppet Forge](https://forge.puppetlabs.com/theforeman/puppet)
or as part of the Foreman installer.

# Usage

As a parameterized class, all the configurable options can be overridden from your
wrapper classes or even your ENC (if it supports param classes). For example:

    # Agent and cron (or daemon):
    class { '::puppet': runmode => 'cron' }

    # Agent and puppetmaster:
    class { '::puppet': server => true }

    # You want to use git?
    class { '::puppet':
      server          => true
      server_git_repo => true
    }

    # Maybe you're using gitolite, new hooks, and a different port?
    class { '::puppet':
      server                   => true
      server_port              => 8141,
      server_git_repo          => true,
      server_git_repo_path     => '/var/lib/gitolite/repositories/puppet.git',
      server_post_hook_name    => 'post-receive.puppet',
      server_post_hook_content => 'puppetserver/post-hook.puppet',
    }

    # Configure master without Foreman integration
    class { '::puppet':
      server                => true,
      server_foreman        => false,
      server_reports        => 'store',
      server_external_nodes => '',
    }

    # Want to integrate with an existing PuppetDB?
    class { '::puppet':
      server                      => true,
      server_puppetdb_host        => 'mypuppetdb.example.com',
      server_reports              => 'puppetdb,foreman',
      server_storeconfigs_backend => 'puppetdb',
    }

Look in _init.pp_ for what can be configured this way, see Contributing if anything
doesn't work.

To use this in standalone mode, edit a file (e.g. install.pp), put in a class resource,
as per the examples above, and the execute _puppet apply_ e.g:

    cat > install.pp <<EOF
    class { '::puppet': server => true }
    EOF
    puppet apply install.pp --modulepath /path_to/extracted_tarball

# Advanced scenarios

An HTTP (non-SSL) puppetmaster instance can be set up (standalone or in addition to
the SSL instance) by setting the `server_http` parameter to `true`. This is useful for
reverse proxy or load balancer scenarios where the proxy/load balancer takes care of SSL
termination. The HTTP puppetmaster instance expects the `X-Client-Verify`, `X-SSL-Client-DN`
and `X-SSL-Subject` HTTP headers to have been set on the front end server.

The listening port can be configured by setting `server_http_port` (which defaults to 8139).

For puppetserver, this HTTP instance accepts **ALL** connections and no further restrictions can be configured.

**Note that running an HTTP puppetmaster is a huge security risk when improperly
configured. Allowed hosts should be tightly controlled; anyone with access to an allowed
host can access all client catalogues and client certificates.**

    # Configure an HTTP puppetmaster vhost in addition to the standard SSL vhost
    class { '::puppet':
      server               => true,
      server_http          => true,
      server_http_port     => 8130, # default: 8139
    }

## Puppet Server configuration

Puppet Server requires slightly different configuration between different
versions, which this module supports. It's recommended that you set the
`server_puppetserver_version` parameter to the MAJOR.MINOR.PATCH version
you have installed. By default the module will configure for the latest
version available.

# Soft Dependencies

If you use a OS which uses systemd you may consider to download `camptocamp/systemd` module for compatibility. 
It is **only** needed if you use the **puppetserver** feature. 

# Contributing

* Fork the project
* Commit and push until you are happy with your contribution

# More info

See https://theforeman.org or at #theforeman irc channel on freenode

Copyright (c) 2010-2012 Ohad Levy

This program and entire repository is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
=======
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
# puppet

[![Build Status](https://travis-ci.org/dhoppe/puppet-puppet.png?branch=master)](https://travis-ci.org/dhoppe/puppet-puppet)
[![Code Coverage](https://coveralls.io/repos/github/dhoppe/puppet-puppet/badge.svg?branch=master)](https://coveralls.io/github/dhoppe/puppet-puppet)
[![Puppet Forge](https://img.shields.io/puppetforge/v/dhoppe/puppet.svg)](https://forge.puppetlabs.com/dhoppe/puppet)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/dhoppe/puppet.svg)](https://forge.puppetlabs.com/dhoppe/puppet)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/dhoppe/puppet.svg)](https://forge.puppetlabs.com/dhoppe/puppet)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/dhoppe/puppet.svg)](https://forge.puppetlabs.com/dhoppe/puppet)

#### Table of Contents

1. [Overview](#overview)
1. [Module Description - What the module does and why it is useful](#module-description)
1. [Setup - The basics of getting started with puppet](#setup)
    * [What puppet affects](#what-puppet-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with puppet](#beginning-with-puppet)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Overview

This module installs, configures and manages the Puppet service.

## Module Description

This module handles installing, configuring and running Puppet across a range of
operating systems and distributions.

## Setup

### What puppet affects

* puppet package.
* puppet configuration file.
* puppet service.

### Setup Requirements

* Puppet >= 3.0
* Facter >= 1.6
* [Extlib module](https://github.com/voxpupuli/puppet-extlib)
* [Stdlib module](https://github.com/puppetlabs/puppetlabs-stdlib)

### Beginning with puppet

Install puppet with the default parameters ***(No configuration files will be changed)***.

```puppet
    class { 'puppet': }
```

Install puppet with the recommended parameters.

#### Client/Server setup (client)

```puppet
    class { 'puppet':
      config_file_template => 'puppet/common/etc/puppet/puppet.conf.erb',
      config_file_hash     => {
        'puppet' => {
          config_file_path     => '/etc/default/puppet',
          config_file_template => 'puppet/common/etc/default/puppet.erb',
        },
      },
    }
```

#### Client/Server setup (server)

```puppet
    class { 'puppet':
      config_file_template => 'puppet/common/etc/puppet/puppetmaster.conf.erb',
      config_file_hash     => {
        'puppet'          => {
          config_file_path     => '/etc/default/puppet',
          config_file_template => 'puppet/common/etc/default/puppet.erb',
        },
        'puppetmaster'    => {
          config_file_path     => '/etc/default/puppetmaster',
          config_file_template => 'puppet/common/etc/default/puppetmaster.erb',
          config_file_notify   => 'Service[puppetmaster]',
          config_file_require  => 'Package[puppetmaster]',
        },
        'auth.conf'       => {
          config_file_path     => '/etc/puppet/auth.conf',
          config_file_template => 'puppet/common/etc/puppet/auth.conf.erb',
          config_file_notify   => 'Service[puppetmaster]',
          config_file_require  => 'Package[puppetmaster]',
        },
        'hiera.yaml'      => {
          config_file_path    => '/etc/puppet/hiera.yaml',
          config_file_source  => 'puppet:///modules/puppet/common/etc/puppet/hiera.yaml',
          config_file_notify  => 'Service[puppetmaster]',
          config_file_require => 'Package[puppetmaster]',
        },
        'fileserver.conf' => {
          config_file_path     => '/etc/puppet/fileserver.conf',
          config_file_template => 'puppet/common/etc/puppet/fileserver.conf.erb',
          config_file_notify   => 'Service[puppetmaster]',
          config_file_require  => 'Package[puppetmaster]',
        },
      },
      master_storeconfigs  => 'puppetdb',
      server_mode          => 'webrick',
    }
```

## Usage

Update the puppet package.

```puppet
    class { 'puppet':
      package_ensure => 'latest',
    }
```

Remove the puppet package.

```puppet
    class { 'puppet':
      package_ensure => 'absent',
    }
```

Purge the puppet package ***(All configuration files will be removed)***.

```puppet
    class { 'puppet':
      package_ensure => 'purged',
    }
```

Deploy the configuration files from source directory.

```puppet
    class { 'puppet':
      config_dir_source => 'puppet:///modules/puppet/common/etc/puppet',
    }
```

Deploy the configuration files from source directory ***(Unmanaged configuration
files will be removed)***.

```puppet
    class { 'puppet':
      config_dir_purge  => true,
      config_dir_source => 'puppet:///modules/puppet/common/etc/puppet',
    }
```

Deploy the configuration file from source.

```puppet
    class { 'puppet':
      config_file_source => 'puppet:///modules/puppet/common/etc/puppet/puppet.conf',
    }
```

Deploy the configuration file from string.

```puppet
    class { 'puppet':
      config_file_string => '# THIS FILE IS MANAGED BY PUPPET',
    }
```

Deploy the configuration file from template.

```puppet
    class { 'puppet':
      config_file_template => 'puppet/common/etc/puppet/puppet.conf.erb',
    }
```

Deploy the configuration file from custom template ***(Additional parameters can
be defined)***.

```puppet
    class { 'puppet':
      config_file_template     => 'puppet/common/etc/puppet/puppet.conf.erb',
      config_file_options_hash => {
        'key' => 'value',
      },
    }
```

Deploy additional configuration files from source, string or template.

```puppet
    class { 'puppet':
      config_file_hash => {
        'puppet.2nd.conf' => {
          config_file_path   => '/etc/puppet/puppet.2nd.conf',
          config_file_source => 'puppet:///modules/puppet/common/etc/puppet/puppet.2nd.conf',
        },
        'puppet.3rd.conf' => {
          config_file_path   => '/etc/puppet/puppet.3rd.conf',
          config_file_string => '# THIS FILE IS MANAGED BY PUPPET',
        },
        'puppet.4th.conf' => {
          config_file_path     => '/etc/puppet/puppet.4th.conf',
          config_file_template => 'puppet/common/etc/puppet/puppet.4th.conf.erb',
        },
      },
    }
```

Disable the puppet service.

```puppet
    class { 'puppet':
      service_ensure => 'stopped',
    }
```

## Reference

### Classes

#### Public Classes

* puppet: Main class, includes all other classes.

#### Private Classes

* puppet::install: Handles the packages.
* puppet::config: Handles the configuration file.
* puppet::service: Handles the service.

### Parameters

#### `package_ensure`

Determines if the package should be installed. Valid values are 'present',
'latest', 'absent' and 'purged'. Defaults to 'present'.

#### `package_name`

Determines the name of package to manage. Defaults to 'puppet'.

#### `package_list`

Determines if additional packages should be managed. Defaults to 'undef'.

#### `config_dir_ensure`

Determines if the configuration directory should be present. Valid values are
'absent' and 'directory'. Defaults to 'directory'.

#### `config_dir_path`

Determines if the configuration directory should be managed. Defaults to '/etc/puppet'

#### `config_dir_purge`

Determines if unmanaged configuration files should be removed. Valid values are
'true' and 'false'. Defaults to 'false'.

#### `config_dir_recurse`

Determines if the configuration directory should be recursively managed. Valid
values are 'true' and 'false'. Defaults to 'true'.

#### `config_dir_source`

Determines the source of a configuration directory. Defaults to 'undef'.

#### `config_file_ensure`

Determines if the configuration file should be present. Valid values are 'absent'
and 'present'. Defaults to 'present'.

#### `config_file_path`

Determines if the configuration file should be managed. Defaults to '/etc/puppet/puppet.conf'

#### `config_file_owner`

Determines which user should own the configuration file. Defaults to 'root'.

#### `config_file_group`

Determines which group should own the configuration file. Defaults to 'root'.

#### `config_file_mode`

Determines the desired permissions mode of the configuration file. Defaults to '0644'.

#### `config_file_source`

Determines the source of a configuration file. Defaults to 'undef'.

#### `config_file_string`

Determines the content of a configuration file. Defaults to 'undef'.

#### `config_file_template`

Determines the content of a configuration file. Defaults to 'undef'.

#### `config_file_notify`

Determines if the service should be restarted after configuration changes.
Defaults to 'Service[puppet]'.

#### `config_file_require`

Determines which package a configuration file depends on. Defaults to 'Package[puppet]'.

#### `config_file_hash`

Determines which configuration files should be managed via `puppet::define`.
Defaults to '{}'.

#### `config_file_options_hash`

Determines which parameters should be passed to an ERB template. Defaults to '{}'.

#### `service_ensure`

Determines if the service should be running or not. Valid values are 'running'
and 'stopped'. Defaults to 'running'.

#### `service_name`

Determines the name of service to manage. Defaults to 'puppet'.

#### `service_enable`

Determines if the service should be enabled at boot. Valid values are 'true'
and 'false'. Defaults to 'true'.

#### `main_etckeeper`

Determines if the etckeeper hooks should be enabled. Valid values are 'true'
and 'false'. Defaults to 'false'.

#### `agent_environment`

Determines which environment should be used. Defaults to 'production'.

#### `agent_listen`

Determines if puppet agent should listen for connections. Valid values are 'true'
and 'false'. Defaults to 'false'.

#### `agent_pluginsync`

Determines if pluginsync should be enabled. Valid values are 'true' and 'false'.
Defaults to 'true'.

#### `agent_puppetdlog`

Determines if puppet agent should write a log to '/var/log/puppet/puppet.log'.
Valid values are 'true' and 'false'. Defaults to 'true'.

#### `agent_report`

Determines if puppet agent should send reports after every transaction. Valid
values are 'true' and 'false'. Defaults to 'true'.

#### `agent_server`

Determines which puppet master should be used. Defaults to "puppet.${::domain}".

#### `master_autosign`

Determines if puppet master should autosign any key request. Defaults to 'false'.

#### `master_environmentpath`

Determines environmentpath to enable directory environments. Defaults to '$confdir/environments'.

#### `master_puppetdlog`

Determines if puppet master should write a log to
'/var/log/puppet/puppetmaster.log'. Valid values are 'true' and 'false'. Defaults
to 'true'.

#### `master_reports`

Determines wich kind of reports puppet master should generate. Valid values are
'http', 'log', 'rrdgraph', 'store' and 'tagmail'. Defaults to '['store']'.

#### `master_storeconfigs`

Determines if the catalog, facts and related data of each client should be stored.
This also enables the import and export of resources. Valid values are 'puppetdb'.
Defaults to 'undef'.

***This module does not install and manage PuppetDB***.

Please use this [PuppetDB module](https://github.com/puppetlabs/puppetlabs-puppetdb)
and the following code for that purpose.

```puppet
    class { 'puppetdb': }
    class { 'puppetdb::master::config':
      manage_storeconfigs => false,
    }
```

#### `master_strict_variables`

Determines if the parser should raise errors when referencing unknown variables.
Valid values are 'true' and 'false'. Defaults to 'false'.

#### `master_stringify_facts`

Determines if fact values should be flatten to string. Valid values are 'true'
and 'false'. Defaults to 'true'.

#### `server_mode`

Determines if puppet master should be installed and how HTTPS requests are served.
Valid values are 'webrick'. Defaults to 'undef'.

## Limitations

This module has been tested on:

* Debian 6/7/8
* Ubuntu 12.04/14.04

## Development

### Bug Report

If you find a bug, have trouble following the documentation or have a question
about this module - please create an issue.

### Pull Request

If you are able to patch the bug or add the feature yourself - please make a
pull request.

### Contributors

The list of contributors can be found at: [https://github.com/dhoppe/puppet-puppet/graphs/contributors](https://github.com/dhoppe/puppet-puppet/graphs/contributors)
<<<<<<< HEAD
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
