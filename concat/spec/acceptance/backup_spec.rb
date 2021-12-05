require 'spec_helper_acceptance'

describe 'concat backup parameter' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')
  context '=> puppet' do
    before(:all) do
      pp = <<-EOS
        file { '#{basedir}':
          ensure => directory,
=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when puppet' do
    let(:pp) do
      <<-MANIFEST
        concat { '#{@basedir}/file':
          backup => 'puppet',
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
        }
        concat::fragment { 'new file':
          target  => '#{@basedir}/file',
          content => 'new contents',
        }
      MANIFEST
    end

    it 'applies the manifest twice with "Filebucketed" stdout and no stderr' do
      expect(apply_manifest(pp, catch_failures: true, debug: true).stdout).to match(%r{Filebucketed.*to puppet with sum.*})
      apply_manifest(pp, catch_changes: true)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{new contents}
    end
  end

  describe 'when .backup' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        backup => '.backup',
      }
      concat::fragment { 'new file':
        target  => '#{@basedir}/file',
        content => 'backup extension',
      }
      MANIFEST
    end

    # XXX Puppet doesn't mention anything about filebucketing with a given
    # extension like .backup
<<<<<<< HEAD
<<<<<<< HEAD
    it 'applies the manifest twice  no stderr' do
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe file("#{basedir}/file") do
      it { should be_file }
      its(:content) { should match /new contents/ }
    end
    describe file("#{basedir}/file.backup") do
      it { should be_file }
      its(:content) { should match /old contents/ }
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when puppet' do
    let(:pp) do
      <<-MANIFEST
        concat { '#{@basedir}/file':
          backup => 'puppet',
        }
        concat::fragment { 'new file':
          target  => '#{@basedir}/file',
          content => 'new contents',
        }
      MANIFEST
    end

    it 'applies the manifest twice with "Filebucketed" stdout and no stderr' do
      expect(apply_manifest(pp, catch_failures: true, debug: true).stdout).to match(%r{Filebucketed.*to puppet with sum.*})
      apply_manifest(pp, catch_changes: true)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{new contents}
    end
  end

  describe 'when .backup' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        backup => '.backup',
      }
      concat::fragment { 'new file':
        target  => '#{@basedir}/file',
        content => 'backup extension',
      }
      MANIFEST
    end

    # XXX Puppet doesn't mention anything about filebucketing with a given
    # extension like .backup
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    it 'applies the manifest twice no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{backup extension}
      expect(file("#{@basedir}/file.backup")).to be_file
      expect(file("#{@basedir}/file.backup").content).to match %r{new contents}
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    end
  end

  # XXX The backup parameter uses validate_string() and thus can't be the
  # boolean false value, but the string 'false' has the same effect in Puppet 3
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  context "=> 'false'" do
    before(:all) do
      pp = <<-EOS
        file { '#{basedir}':
          ensure => directory,
        }
        file { '#{basedir}/file':
          content => "old contents\n",
        }
      EOS
      apply_manifest(pp)
    end
    pp = <<-EOS
      concat { '#{basedir}/file':
=======
  describe "when 'false'" do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        backup => '.backup',
      }
      concat::fragment { 'new file':
        target  => '#{@basedir}/file',
        content => 'new contents',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no "Filebucketed" stdout and no stderr' do
      apply_manifest(pp, catch_failures: true) do |r|
        expect(r.stdout).not_to match(%r{Filebucketed})
      end
<<<<<<< HEAD
      apply_manifest(pp, :catch_changes => true)
    end

    describe file("#{basedir}/file") do
      it { should be_file }
      its(:content) { should match /new contents/ }
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
  describe "when 'false'" do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        backup => '.backup',
      }
      concat::fragment { 'new file':
        target  => '#{@basedir}/file',
        content => 'new contents',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no "Filebucketed" stdout and no stderr' do
      apply_manifest(pp, catch_failures: true) do |r|
        expect(r.stdout).not_to match(%r{Filebucketed})
      end
      apply_manifest(pp, catch_changes: true)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{new contents}
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
      apply_manifest(pp, catch_changes: true)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{new contents}
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
    end
  end
end
