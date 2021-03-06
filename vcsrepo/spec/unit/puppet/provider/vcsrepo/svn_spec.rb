require 'spec_helper'

describe Puppet::Type.type(:vcsrepo).provider(:svn) do

  let(:resource) { Puppet::Type.type(:vcsrepo).new({
    :name     => 'test',
    :ensure   => :present,
    :provider => :svn,
    :path     => '/tmp/vcsrepo',
  })}

  let(:provider) { resource.provider }

  before :each do
    Puppet::Util.stubs(:which).with('git').returns('/usr/bin/git')
  end

  describe 'creating' do
    context 'with source and revision' do
      it "should execute 'svn checkout' with a revision" do
        resource[:source] = 'exists'
        resource[:revision] = '1'
        provider.expects(:svn).with('--non-interactive', 'checkout', '-r',
          resource.value(:revision),
          resource.value(:source),
          resource.value(:path))
        provider.create
      end
    end
    context 'with source' do
      it "should just execute 'svn checkout' without a revision" do
        resource[:source] = 'exists'
        provider.expects(:svn).with('--non-interactive', 'checkout',
          resource.value(:source),
          resource.value(:path))
        provider.create
      end
    end

    context 'with fstype' do
      it "should execute 'svnadmin create' with an '--fs-type' option" do
        resource[:fstype] = 'ext4'
        provider.expects(:svnadmin).with('create', '--fs-type',
                                          resource.value(:fstype),
                                          resource.value(:path))
        provider.create
      end
    end
    context 'without fstype' do
      it "should execute 'svnadmin create' without an '--fs-type' option" do
        provider.expects(:svnadmin).with('create', resource.value(:path))
        provider.create
      end
    end
<<<<<<< HEAD
=======
    
>>>>>>> c9b52c6393265c3a51bd8b3201b3bfbe07fcc044
    context "with depth" do
      it "should execute 'svn checkout' with a depth" do
        resource[:source] = 'exists'
        resource[:depth] = 'infinity'
        provider.expects(:svn).with('--non-interactive', 'checkout', '--depth', 'infinity',
          resource.value(:source),
          resource.value(:path))
        provider.create
      end
    end
<<<<<<< HEAD
=======
    
>>>>>>> c9b52c6393265c3a51bd8b3201b3bfbe07fcc044
    context "with trust_server_cert" do
      it "should execute 'svn checkout' without a trust-server-cert" do
        resource[:source] = 'exists'
        resource[:trust_server_cert] = :false
        provider.expects(:svn).with('--non-interactive', 'checkout',
          resource.value(:source),
          resource.value(:path))
        provider.create
      end
      it "should execute 'svn checkout' with a trust-server-cert" do
        resource[:source] = 'exists'
        resource[:trust_server_cert] = :true
        provider.expects(:svn).with('--non-interactive', '--trust-server-cert', 'checkout',
          resource.value(:source),
          resource.value(:path))
        provider.create
      end
    end
  end

  describe 'destroying' do
    it "it should remove the directory" do
      expects_rm_rf
      provider.destroy
    end
  end

  describe "checking existence" do
    it "should check for the directory" do
      expects_directory?(true, resource.value(:path))
      expects_directory?(true, File.join(resource.value(:path), '.svn'))
      provider.exists?
    end
  end

  describe "checking the revision property" do
    before do
      provider.expects(:svn).with('--non-interactive', 'info').returns(fixture(:svn_info))
    end
    it "should use 'svn info'" do
      expects_chdir
      expect(provider.revision).to eq('4') # From 'Revision', not 'Last Changed Rev'
    end
  end

  describe "setting the revision property" do
    before do
      @revision = '30'
    end
    context 'with conflict' do
      it "should use 'svn update'" do
        resource[:conflict] = 'theirs-full'
        expects_chdir
        provider.expects(:svn).with('--non-interactive', 'update',
                                    '-r', @revision,
                                    '--accept', resource.value(:conflict))
        provider.revision = @revision
      end
    end
    context 'without conflict' do
      it "should use 'svn update'" do
        expects_chdir
        provider.expects(:svn).with('--non-interactive', 'update', '-r', @revision)
        provider.revision = @revision
      end
    end
  end

  describe "setting the revision property and repo source" do
    before do
      @revision = '30'
    end
    context 'with conflict' do
      it "should use 'svn switch'" do
        resource[:source] = 'an-unimportant-value'
        resource[:conflict] = 'theirs-full'
        expects_chdir
        provider.expects(:svn).with('--non-interactive', 'switch',
                                    '-r', @revision, 'an-unimportant-value',
                                    '--accept', resource.value(:conflict))
        provider.revision = @revision
      end
    end
    context 'without conflict' do
      it "should use 'svn switch'" do
        resource[:source] = 'an-unimportant-value'
        expects_chdir
        provider.expects(:svn).with('--non-interactive', 'switch', '-r', @revision, 'an-unimportant-value')
        provider.revision = @revision
      end
    end
  end

end
