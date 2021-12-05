require 'spec_helper_acceptance'

describe 'concat::fragment replace' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')

  context 'should create fragment files' do
    before(:all) do
      pp = <<-EOS
        file { '#{basedir}':
          ensure => directory,
        }
      EOS
      apply_manifest(pp)
    end

    pp1 = <<-EOS
      concat { '#{basedir}/foo': }

=======
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when run should create fragment files' do
    let(:pp1) do
      <<-MANIFEST
      concat { '#{@basedir}/foo': }
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace unset run 1',
      }
    MANIFEST
    end
    let(:pp2) do
      <<-MANIFEST
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace unset run 2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp1)
      idempotent_apply(pp2)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).not_to match 'caller has replace unset run 1'
      expect(file("#{@basedir}/foo").content).to match 'caller has replace unset run 2'
    end
  end
  # should create fragment files

  describe 'when run should replace its own fragment files when caller has File { replace=>true } set' do
    let(:pp1) do
      <<-MANIFEST
      File { replace=>true }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace true set run 1',
      }
    MANIFEST
    end
    let(:pp2) do
      <<-MANIFEST
      File { replace=>true }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace true set run 2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp1)
      idempotent_apply(pp2)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).not_to match 'caller has replace true set run 1'
      expect(file("#{@basedir}/foo").content).to match 'caller has replace true set run 2'
    end
  end
  # should replace its own fragment files when caller has File(replace=>true) set

  describe 'when run should replace its own fragment files even when caller has File { replace=>false } set' do
    let(:pp1) do
      <<-MANIFEST
      File { replace=>false }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace false set run 1',
      }
    MANIFEST
    end
    let(:pp2) do
      <<-MANIFEST
      File { replace=>false }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace false set run 2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp1)
      idempotent_apply(pp2)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).not_to match 'caller has replace false set run 1'
      expect(file("#{@basedir}/foo").content).to match 'caller has replace false set run 2'
    end
<<<<<<< HEAD
  end # should replace its own fragment files even when caller has File(replace=>false) set

=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when run should create fragment files' do
    let(:pp1) do
      <<-MANIFEST
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace unset run 1',
      }
    MANIFEST
    end
    let(:pp2) do
      <<-MANIFEST
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace unset run 2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp1)
      idempotent_apply(pp2)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).not_to match 'caller has replace unset run 1'
      expect(file("#{@basedir}/foo").content).to match 'caller has replace unset run 2'
    end
  end
  # should create fragment files

  describe 'when run should replace its own fragment files when caller has File { replace=>true } set' do
    let(:pp1) do
      <<-MANIFEST
      File { replace=>true }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace true set run 1',
      }
    MANIFEST
    end
    let(:pp2) do
      <<-MANIFEST
      File { replace=>true }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace true set run 2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp1)
      idempotent_apply(pp2)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).not_to match 'caller has replace true set run 1'
      expect(file("#{@basedir}/foo").content).to match 'caller has replace true set run 2'
    end
  end
  # should replace its own fragment files when caller has File(replace=>true) set

  describe 'when run should replace its own fragment files even when caller has File { replace=>false } set' do
    let(:pp1) do
      <<-MANIFEST
      File { replace=>false }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace false set run 1',
      }
    MANIFEST
    end
    let(:pp2) do
      <<-MANIFEST
      File { replace=>false }
      concat { '#{@basedir}/foo': }
      concat::fragment { '1':
        target  => '#{@basedir}/foo',
        content => 'caller has replace false set run 2',
      }
    MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp1)
      idempotent_apply(pp2)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).not_to match 'caller has replace false set run 1'
      expect(file("#{@basedir}/foo").content).to match 'caller has replace false set run 2'
    end
  end
  # should replace its own fragment files even when caller has File(replace=>false) set
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 358c2d5599e3b70bbdd5e12ad751d558ed2fc6b8
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
  end
  # should replace its own fragment files even when caller has File(replace=>false) set
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
