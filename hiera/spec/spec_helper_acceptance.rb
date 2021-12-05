require 'beaker-rspec'
require 'beaker-puppet'
require 'beaker/puppet_install_helper'
<<<<<<< HEAD
require 'beaker/module_install_helper'
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

def wait_for_master(max_retries)
  1.upto(max_retries) do |retries|
    on(master, "curl -skIL https://#{master.hostname}:8140", acceptable_exit_codes: [0, 1, 7]) do |result|
      return true if result.stdout =~ %r{HTTP/1\.1 4}

      counter = 2**retries
      logger.debug "Unable to reach Puppet Master, #{master.hostname}, Sleeping #{counter} seconds for retry #{retries}..."
      sleep counter
    end
  end
  raise 'Could not connect to Puppet Master.'
end

def make_site_pp(pp, path = File.join(master['puppetpath'], 'manifests'))
  on master, "mkdir -p #{path}"
  create_remote_file(master, File.join(path, 'site.pp'), pp)
  on master, "chown -R #{puppet_user(master)}:#{puppet_group(master)} #{path}"
  on master, "chmod -R 0755 #{path}"
  on master, "service #{(master['puppetservice'] || 'puppetserver')} restart"
  wait_for_master(3)
end
# rubocop:enable AbcSize

<<<<<<< HEAD
run_puppet_install_helper unless ENV['BEAKER_provision'] == 'no'
=======
run_puppet_install_helper
unless ENV['RS_PROVISION'] == 'no' || ENV['BEAKER_provision'] == 'no'
  if ENV['PUPPET_INSTALL_TYPE'] == 'agent'
    pp = <<-EOS
    package { 'puppetserver': ensure => present, }
    service { 'puppetserver': ensure => running, }
    EOS
    apply_manifest_on(master, pp)
  end
end
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

RSpec.configure do |c|
  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
<<<<<<< HEAD
    install_module
    install_module_dependencies
    install_module_from_forge('puppetlabs-puppetserver_gem', '>= 0')

    hosts.each do |host|
      if ENV['PUPPET_INSTALL_TYPE'] == 'agent' && ENV['BEAKER_provision'] != 'no'
        host.install_package('puppetserver')
        on host, puppet('resource', 'service', 'puppetserver', 'ensure=running')
      end
=======
    # Install module and dependencies
    puppet_module_install(source: proj_root, module_name: 'hiera')
    hosts.each do |host|
      on host, puppet('module', 'install', 'puppetlabs-stdlib'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-inifile'), acceptable_exit_codes: [0, 1]
      on host, puppet('module', 'install', 'puppetlabs-puppetserver_gem'), acceptable_exit_codes: [0, 1]
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end
  end
end
