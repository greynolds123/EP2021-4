require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
case fact('osfamily')
  when 'AIX'
    username = 'root'
    groupname = 'system'
    scriptname = 'concatfragments.rb'
    vardir = default.puppet['vardir']
    if vardir.nil? or vardir == ''
      vardir = '/opt/puppetlabs/puppet/cache'
    end
  when 'Darwin'
    username = 'root'
    groupname = 'wheel'
    scriptname = 'concatfragments.rb'
    vardir = default.puppet['vardir']
    if vardir.nil? or vardir == ''
      vardir = '/opt/puppetlabs/puppet/cache'
    end
  when 'windows'
    username = 'Administrator'
    groupname = 'Administrators'
    scriptname = 'concatfragments.rb'
    result = on default, "echo #{default.puppet['vardir']}"
    vardir = result.raw_output.chomp
  when 'Solaris'
    username = 'root'
    groupname = 'root'
    scriptname = 'concatfragments.rb'
    vardir = default.puppet['vardir']
    if vardir.nil? or vardir == ''
      vardir = '/opt/puppetlabs/puppet/cache'
    end
  else
    username = 'root'
    groupname = 'root'
    scriptname = 'concatfragments.rb'
    vardir = default.puppet['vardir']
    if vardir.nil? or vardir == ''
      vardir = '/opt/puppetlabs/puppet/cache'
    end
=======
case os[:family]
when 'aix'
  username = 'root'
  groupname = 'system'
when 'darwin'
  username = 'root'
  groupname = 'wheel'
when 'windows'
  username = 'Administrator'
  groupname = 'Administrators'
else
  username = 'root'
  groupname = 'root'
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end

describe 'basic concat test' do
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'with owner/group root' do
    let(:pp) do
      <<-MANIFEST
        concat { '#{@basedir}/file':
          owner => '#{username}',
          group => '#{groupname}',
          mode  => '0644',
        }

        concat::fragment { '1':
          target  => '#{@basedir}/file',
          content => '1',
          order   => '01',
        }

        concat::fragment { '2':
          target  => '#{@basedir}/file',
          content => '2',
          order   => '02',
        }
      MANIFEST
    end

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file")).to be_owned_by username unless os[:family] == 'windows'
      expect(file("#{@basedir}/file")).to be_grouped_into groupname unless os[:family] == 'windows' || os[:family] == 'darwin'
      expect(file("#{@basedir}/file")).to be_mode 644 unless os[:family] == 'aix' || os[:family] == 'windows'
      expect(file("#{@basedir}/file").content).to match '1'
      expect(file("#{@basedir}/file").content).to match '2'
    end
  end

  describe 'when present with path set' do
    let(:pp) do
      <<-MANIFEST
        concat { 'file':
          ensure => present,
<<<<<<< HEAD
          path   => '#{basedir}/file',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
case os[:family]
when 'aix'
  username = 'root'
  groupname = 'system'
when 'darwin'
  username = 'root'
  groupname = 'wheel'
when 'windows'
  username = 'Administrator'
  groupname = 'Administrators'
else
  username = 'root'
  groupname = 'root'
end

describe 'basic concat test' do
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'with owner/group root' do
    let(:pp) do
      <<-MANIFEST
        concat { '#{@basedir}/file':
          owner => '#{username}',
          group => '#{groupname}',
          mode  => '0644',
        }

        concat::fragment { '1':
          target  => '#{@basedir}/file',
          content => '1',
          order   => '01',
        }

        concat::fragment { '2':
          target  => '#{@basedir}/file',
          content => '2',
          order   => '02',
        }
      MANIFEST
    end

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file")).to be_owned_by username unless os[:family] == 'windows'
      expect(file("#{@basedir}/file")).to be_grouped_into groupname unless os[:family] == 'windows' || os[:family] == 'darwin'
      expect(file("#{@basedir}/file")).to be_mode 644 unless os[:family] == 'aix' || os[:family] == 'windows'
      expect(file("#{@basedir}/file").content).to match '1'
      expect(file("#{@basedir}/file").content).to match '2'
    end
  end

  describe 'when present with path set' do
    let(:pp) do
      <<-MANIFEST
        concat { 'file':
          ensure => present,
          path   => '#{@basedir}/file',
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path   => '#{@basedir}/file',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
          mode   => '0644',
        }
        concat::fragment { '1':
          target  => 'file',
          content => '1',
          order   => '01',
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      "

      it_behaves_like 'successfully_applied', pp
=======
      MANIFEST
    end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file")).to be_mode 644 unless os[:family] == 'aix' || os[:family] == 'windows'
      expect(file("#{@basedir}/file").content).to match '1'
    end
  end

  describe 'when absent with path set' do
    let(:pp) do
      <<-MANIFEST
        concat { 'file':
          ensure => absent,
<<<<<<< HEAD
          path   => '#{basedir}/file',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      MANIFEST
    end

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file")).to be_mode 644 unless os[:family] == 'aix' || os[:family] == 'windows'
      expect(file("#{@basedir}/file").content).to match '1'
    end
  end

  describe 'when absent with path set' do
    let(:pp) do
      <<-MANIFEST
        concat { 'file':
          ensure => absent,
          path   => '#{@basedir}/file',
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path   => '#{@basedir}/file',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
          mode   => '0644',
        }
        concat::fragment { '1':
          target  => 'file',
          content => '1',
          order   => '01',
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      "

      it 'applies the manifest twice with no stderr' do
        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true)
      end
=======
      MANIFEST
    end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).not_to be_file
    end
  end

  describe 'when present with path that has special characters' do
    filename = (os[:family] == 'windows') ? 'file(1)' : 'file(1:2)'

    let(:pp) do
      <<-MANIFEST
        concat { '#{filename}':
          ensure => present,
<<<<<<< HEAD
          path   => '#{basedir}/#{filename}',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).not_to be_file
    end
  end

  describe 'when present with path that has special characters' do
    filename = (os[:family] == 'windows') ? 'file(1)' : 'file(1:2)'

    let(:pp) do
      <<-MANIFEST
        concat { '#{filename}':
          ensure => present,
          path   => '#{@basedir}/#{filename}',
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path   => '#{@basedir}/#{filename}',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
          mode   => '0644',
        }
        concat::fragment { '1':
          target  => '#{filename}',
          content => '1',
          order   => '01',
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      "

      it_behaves_like 'successfully_applied', pp
=======
      MANIFEST
    end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/#{filename}")).to be_file
      expect(file("#{@basedir}/#{filename}")).to be_mode 644 unless os[:family] == 'aix' || os[:family] == 'windows'
      expect(file("#{@basedir}/#{filename}").content).to match '1'
    end
  end

  describe 'with noop properly' do
    let(:pp) do
      <<-MANIFEST
        concat { 'file':
          ensure => present,
<<<<<<< HEAD
          path   => '#{basedir}/file',
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      MANIFEST
    end

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/#{filename}")).to be_file
      expect(file("#{@basedir}/#{filename}")).to be_mode 644 unless os[:family] == 'aix' || os[:family] == 'windows'
      expect(file("#{@basedir}/#{filename}").content).to match '1'
    end
  end

  describe 'with noop properly' do
    let(:pp) do
      <<-MANIFEST
        concat { 'file':
          ensure => present,
          path   => '#{@basedir}/file',
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
          path   => '#{@basedir}/file',
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
          mode   => '0644',
          noop   => true,
        }
        concat::fragment { '1':
          target  => 'file',
          content => '1',
          order   => '01',
        }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
      "

      it_behaves_like 'successfully_applied', pp

      describe file("#{basedir}/file") do
        it { should_not be_file }
      end
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
      MANIFEST
    end

    it 'applies manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).not_to be_file
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
      MANIFEST
    end

    it 'applies manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).not_to be_file
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
    end
  end
end
