class pe_repo::platform::sles_15_x86_64(
  $agent_version = $::aio_agent_build,
){
  include pe_repo

  pe_repo::sles { 'sles-15-x86_64':
    agent_version => $agent_version,
    pe_version => $pe_repo::default_pe_build,
  }
}
