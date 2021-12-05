require 'spec_helper_acceptance'

describe 'quoted paths' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')

=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'with path with blanks' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/concat test':
          ensure => directory,
        }
        concat { '#{@basedir}/concat test/foo':
        }
        concat::fragment { '1':
          target  => '#{@basedir}/concat test/foo',
          content => 'string1',
        }
        concat::fragment { '2':
          target  => '#{@basedir}/concat test/foo',
          content => 'string2',
        }
      MANIFEST
    end

<<<<<<< HEAD
    describe file("#{basedir}/concat test/foo") do
      it { should be_file }
      its(:content) { should match /string1string2/ }
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

  describe 'with path with blanks' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/concat test':
          ensure => directory,
        }
        concat { '#{@basedir}/concat test/foo':
        }
        concat::fragment { '1':
          target  => '#{@basedir}/concat test/foo',
          content => 'string1',
        }
        concat::fragment { '2':
          target  => '#{@basedir}/concat test/foo',
          content => 'string2',
        }
      MANIFEST
    end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/concat test/foo")).to be_file
      expect(file("#{@basedir}/concat test/foo").content).to match %r{string1string2}
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end
  end
end
