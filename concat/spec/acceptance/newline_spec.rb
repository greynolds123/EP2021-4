require 'spec_helper_acceptance'

describe 'concat ensure_newline parameter' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')
  context '=> false' do
    before(:all) do
      pp = <<-EOS
        file { '#{basedir}':
          ensure => directory
        }
      EOS

      apply_manifest(pp)
    end
    pp = <<-EOS
      concat { '#{basedir}/file':
=======
  before(:all) do
    @basedir = setup_test_directory
  end
  describe 'when false' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
        ensure_newline => false,
      }
      concat::fragment { '1':
        target  => '#{@basedir}/file',
        content => '1',
      }
      concat::fragment { '2':
        target  => '#{@basedir}/file',
        content => '2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match '12'
    end
  end

  describe 'when true' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        ensure_newline => true,
      }
      concat::fragment { '1':
        target  => '#{@basedir}/file',
        content => '1',
      }
      concat::fragment { '2':
        target  => '#{@basedir}/file',
        content => '2',
      }
    MANIFEST
    end

<<<<<<< HEAD
    describe file("#{basedir}/file") do
      it { should be_file }
      its(:content) {
        should match /1\n2\n/
      }
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
  before(:all) do
    @basedir = setup_test_directory
  end
  describe 'when false' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        ensure_newline => false,
      }
      concat::fragment { '1':
        target  => '#{@basedir}/file',
        content => '1',
      }
      concat::fragment { '2':
        target  => '#{@basedir}/file',
        content => '2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match '12'
    end
  end

  describe 'when true' do
    let(:pp) do
      <<-MANIFEST
      concat { '#{@basedir}/file':
        ensure_newline => true,
      }
      concat::fragment { '1':
        target  => '#{@basedir}/file',
        content => '1',
      }
      concat::fragment { '2':
        target  => '#{@basedir}/file',
        content => '2',
      }
    MANIFEST
    end

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/file")).to be_file
      expect(file("#{@basedir}/file").content).to match %r{1\r?\n2\r?\n}
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
    end
  end
end
