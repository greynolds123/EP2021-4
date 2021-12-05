require 'spec_helper_acceptance'

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
case fact('osfamily')
  when 'AIX'
    username = 'root'
    groupname = 'system'
  when 'Darwin'
    username = 'root'
    groupname = 'wheel'
  when 'windows'
    username = 'Administrator'
    groupname = 'Administrators'
  else
    username = 'root'
    groupname = 'root'
=======
=======
>>>>>>> 5543a6b918d57f6620cb126b141fdd787103be97
=======
>>>>>>> fdbd39eef4bbf49d3b1c939e730df11545dc240e
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
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
end

describe 'concat::fragment source' do
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when run should read file fragments from local system' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/file1':
          content => "file1 contents\n"
        }
        file { '#{@basedir}/file2':
          content => "file2 contents\n"
        }
        concat { '#{@basedir}/foo': }

        concat::fragment { '1':
          target  => '#{@basedir}/foo',
          source  => '#{@basedir}/file1',
          require => File['#{@basedir}/file1'],
        }
        concat::fragment { '2':
          target  => '#{@basedir}/foo',
          content => 'string1 contents',
        }
        concat::fragment { '3':
          target  => '#{@basedir}/foo',
          source  => '#{@basedir}/file2',
          require => File['#{@basedir}/file2'],
        }
      MANIFEST
    end

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).to match 'file1 contents'
      expect(file("#{@basedir}/foo").content).to match 'file2 contents'
    end
  end

  describe 'when run should create files containing first match only.' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/file1':
          content => "file1 contents\n"
        }
        file { '#{@basedir}/file2':
          content => "file2 contents\n"
        }
        concat { '#{@basedir}/result_file1':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }
        concat { '#{@basedir}/result_file2':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }
        concat { '#{@basedir}/result_file3':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }

        concat::fragment { '1':
          target  => '#{@basedir}/result_file1',
          source  => [ '#{@basedir}/file1', '#{@basedir}/file2' ],
          require => [ File['#{@basedir}/file1'], File['#{@basedir}/file2'] ],
          order   => '01',
        }
        concat::fragment { '2':
          target  => '#{@basedir}/result_file2',
          source  => [ '#{@basedir}/file2', '#{@basedir}/file1' ],
          require => [ File['#{@basedir}/file1'], File['#{@basedir}/file2'] ],
          order   => '01',
        }
        concat::fragment { '3':
          target  => '#{@basedir}/result_file3',
          source  => [ '#{@basedir}/file1', '#{@basedir}/file2' ],
          require => [ File['#{@basedir}/file1'], File['#{@basedir}/file2'] ],
          order   => '01',
        }
      MANIFEST
    end

    it 'idempotent, files match' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/result_file1")).to be_file
      expect(file("#{@basedir}/result_file1").content).to match 'file1 contents'
      expect(file("#{@basedir}/result_file1").content).not_to match 'file2 contents'

      expect(file("#{@basedir}/result_file2")).to be_file
      expect(file("#{@basedir}/result_file2").content).to match 'file2 contents'
      expect(file("#{@basedir}/result_file2").content).not_to match 'file1 contents'

      expect(file("#{@basedir}/result_file3")).to be_file
      expect(file("#{@basedir}/result_file3").content).to match 'file1 contents'
      expect(file("#{@basedir}/result_file3").content).not_to match 'file2 contents'
    end
  end

  describe 'when run should fail if no match on source.' do
    let(:pp) do
      <<-MANIFEST
        concat { '#{@basedir}/fail_no_source':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }

        concat::fragment { '1':
          target  => '#{@basedir}/fail_no_source',
          source => [ '#{@basedir}/nofilehere', '#{@basedir}/nothereeither' ],
          order   => '01',
        }
      MANIFEST
    end

    it 'applies the manifest with resource failures' do
      expect(apply_manifest(pp, expect_failures: true).stderr).to match(%r{Failed to generate additional resources using 'eval_generate'})
      expect(file("#{@basedir}/fail_no_source")).not_to be_directory
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

describe 'concat::fragment source' do
  before(:all) do
    @basedir = setup_test_directory
  end

  describe 'when run should read file fragments from local system' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/file1':
          content => "file1 contents\n"
        }
        file { '#{@basedir}/file2':
          content => "file2 contents\n"
        }
        concat { '#{@basedir}/foo': }

        concat::fragment { '1':
          target  => '#{@basedir}/foo',
          source  => '#{@basedir}/file1',
          require => File['#{@basedir}/file1'],
        }
        concat::fragment { '2':
          target  => '#{@basedir}/foo',
          content => 'string1 contents',
        }
        concat::fragment { '3':
          target  => '#{@basedir}/foo',
          source  => '#{@basedir}/file2',
          require => File['#{@basedir}/file2'],
        }
      MANIFEST
    end

    it 'idempotent, file matches' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/foo")).to be_file
      expect(file("#{@basedir}/foo").content).to match 'file1 contents'
      expect(file("#{@basedir}/foo").content).to match 'file2 contents'
    end
  end

  describe 'when run should create files containing first match only.' do
    let(:pp) do
      <<-MANIFEST
        file { '#{@basedir}/file1':
          content => "file1 contents\n"
        }
        file { '#{@basedir}/file2':
          content => "file2 contents\n"
        }
        concat { '#{@basedir}/result_file1':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }
        concat { '#{@basedir}/result_file2':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }
        concat { '#{@basedir}/result_file3':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }

        concat::fragment { '1':
          target  => '#{@basedir}/result_file1',
          source  => [ '#{@basedir}/file1', '#{@basedir}/file2' ],
          require => [ File['#{@basedir}/file1'], File['#{@basedir}/file2'] ],
          order   => '01',
        }
        concat::fragment { '2':
          target  => '#{@basedir}/result_file2',
          source  => [ '#{@basedir}/file2', '#{@basedir}/file1' ],
          require => [ File['#{@basedir}/file1'], File['#{@basedir}/file2'] ],
          order   => '01',
        }
        concat::fragment { '3':
          target  => '#{@basedir}/result_file3',
          source  => [ '#{@basedir}/file1', '#{@basedir}/file2' ],
          require => [ File['#{@basedir}/file1'], File['#{@basedir}/file2'] ],
          order   => '01',
        }
      MANIFEST
    end

    it 'idempotent, files match' do
      idempotent_apply(pp)
      expect(file("#{@basedir}/result_file1")).to be_file
      expect(file("#{@basedir}/result_file1").content).to match 'file1 contents'
      expect(file("#{@basedir}/result_file1").content).not_to match 'file2 contents'

      expect(file("#{@basedir}/result_file2")).to be_file
      expect(file("#{@basedir}/result_file2").content).to match 'file2 contents'
      expect(file("#{@basedir}/result_file2").content).not_to match 'file1 contents'

      expect(file("#{@basedir}/result_file3")).to be_file
      expect(file("#{@basedir}/result_file3").content).to match 'file1 contents'
      expect(file("#{@basedir}/result_file3").content).not_to match 'file2 contents'
    end
  end

  describe 'when run should fail if no match on source.' do
    let(:pp) do
      <<-MANIFEST
        concat { '#{@basedir}/fail_no_source':
          owner   => '#{username}',
          group   => '#{groupname}',
          mode    => '0644',
        }

        concat::fragment { '1':
          target  => '#{@basedir}/fail_no_source',
          source => [ '#{@basedir}/nofilehere', '#{@basedir}/nothereeither' ],
          order   => '01',
        }
      MANIFEST
    end

    it 'applies the manifest with resource failures' do
      expect(apply_manifest(pp, expect_failures: true).stderr).to match(%r{Failed to generate additional resources using 'eval_generate'})
      expect(file("#{@basedir}/fail_no_source")).not_to be_directory
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
