require 'spec_helper_acceptance'

describe 'symbolic name' do
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
  basedir = default.tmpdir('concat')
  pp = <<-EOS
    concat { 'not_abs_path':
      path => '#{basedir}/file',
    }
=======
  before(:all) do
    @basedir = setup_test_directory
  end
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
  before(:all) do
    @basedir = setup_test_directory
  end
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97

  let(:pp) do
    <<-MANIFEST
      concat { 'not_abs_path':
        path => '#{@basedir}/file',
      }

      concat::fragment { '1':
        target  => 'not_abs_path',
        content => '1',
        order   => '01',
      }

      concat::fragment { '2':
        target  => 'not_abs_path',
        content => '2',
        order   => '02',
      }
    MANIFEST
  end

<<<<<<< HEAD
<<<<<<< HEAD
  describe file("#{basedir}/file") do
    it { should be_file }
    its(:content) {
      should match '1'
      should match '2'
    }
=======
=======
>>>>>>> ed5efc529b7bf9185a6bc125b2e287f5aa6077c4
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  before(:all) do
    @basedir = setup_test_directory
  end

  let(:pp) do
    <<-MANIFEST
      concat { 'not_abs_path':
        path => '#{@basedir}/file',
      }

      concat::fragment { '1':
        target  => 'not_abs_path',
        content => '1',
        order   => '01',
      }

      concat::fragment { '2':
        target  => 'not_abs_path',
        content => '2',
        order   => '02',
      }
    MANIFEST
  end

<<<<<<< HEAD
=======
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
  it 'applies the manifest twice with no stderr' do
    idempotent_apply(pp)
    expect(file("#{@basedir}/file")).to be_file
    expect(file("#{@basedir}/file").content).to match '1'
    expect(file("#{@basedir}/file").content).to match '2'
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
  end
end
