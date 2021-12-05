require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
describe 'with file recursive purge' do
  basedir = default.tmpdir('concat')
  context 'should still create concat file' do
    pp = <<-EOS
      file { '#{basedir}/bar':
        ensure => directory,
        purge  => true,
        recurse => true,
      }
=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
describe 'concurrency, with file recursive purge' do
  before(:all) do
    @basedir = setup_test_directory
  end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b

  describe 'when run should still create concat file' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/bar':
          ensure => directory,
          purge  => true,
          recurse => true,
        }

        concat { "foobar":
          ensure => 'present',
          path   => '#{@basedir}/bar/foobar',
        }

        concat::fragment { 'foo':
          target => 'foobar',
          content => 'foo',
        }
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/bar/foobar")).to be_file
      expect(file("#{@basedir}/bar/foobar").content).to match 'foo'
    end
  end
end
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
describe 'concurrency, with file recursive purge' do
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when run should still create concat file' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/bar':
          ensure => directory,
          purge  => true,
          recurse => true,
        }

        concat { "foobar":
          ensure => 'present',
          path   => '#{@basedir}/bar/foobar',
        }

        concat::fragment { 'foo':
          target => 'foobar',
          content => 'foo',
        }
      MANIFEST
    end

    it 'applies the manifest twice with no stderr' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/bar/foobar")).to be_file
      expect(file("#{@basedir}/bar/foobar").content).to match 'foo'
    end
  end
end
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
