module AIOAgentBuild
  def self.get_aio_build
<<<<<<< HEAD
    os = Facter.value(:os) || {}
    osfamily = os['family']
=======
    osfamily = Facter.value(:osfamily)
>>>>>>> f3fe550ac8da9a8477035fe16f80a1178d7a7547
    case osfamily
    when /windows/
      puppet_dir = Facter.value(:env_windows_installdir)
      agent_version_file = "#{puppet_dir}/VERSION"
    else
      agent_version_file = '/opt/puppetlabs/puppet/VERSION'
    end

    if File.readable? agent_version_file and !File.zero? agent_version_file
      agent_version = File.open(agent_version_file, 'r').gets.chomp
      return agent_version
    else
      nil
    end
  end
end
