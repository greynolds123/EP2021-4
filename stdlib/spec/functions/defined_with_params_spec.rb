require 'spec_helper'

describe 'defined_with_params' do
  describe 'when no resource is specified' do
    it { is_expected.to run.with_params.and_raise_error(ArgumentError) }
  end
  describe 'when compared against a resource with no attributes' do
    let :pre_condition do
      'user { "dan": }'
    end

    it { is_expected.to run.with_params('User[dan]', {}).and_return(true) }
    it { is_expected.to run.with_params('User[bob]', {}).and_return(false) }
    it { is_expected.to run.with_params('User[dan]', 'foo' => 'bar').and_return(false) }

    context 'with UTF8 and double byte characters' do
      it { is_expected.to run.with_params('User[ĵĭмოү]', {}).and_return(false) }
      it { is_expected.to run.with_params('User[ポーラ]', {}).and_return(false) }
    end
  end

  describe 'when compared against a resource with attributes' do
    let :pre_condition do
      'user { "dan": ensure => present, shell => "/bin/csh", managehome => false}'
    end

    it { is_expected.to run.with_params('User[dan]', {}).and_return(true) }
    it { is_expected.to run.with_params('User[dan]', '').and_return(true) }
    it { is_expected.to run.with_params('User[dan]', 'ensure' => 'present').and_return(true) }
    it { is_expected.to run.with_params('User[dan]', 'ensure' => 'present', 'managehome' => false).and_return(true) }
    it { is_expected.to run.with_params('User[dan]', 'ensure' => 'absent', 'managehome' => false).and_return(false) }
  end

  describe 'when passing undef values' do
    let :pre_condition do
      'file { "/tmp/a": ensure => present }'
    end
    let(:is_puppet_6_or_greater) { Puppet::Util::Package.versioncmp(Puppet.version, '6.0.0') >= 0 }
    let(:undef_value) { is_puppet_6_or_greater ? nil : :undef } # even if :undef would work on 6.0.1, :undef should not be used

    it { is_expected.to run.with_params('File[/tmp/a]', {}).and_return(true) }
<<<<<<< HEAD
    it { is_expected.to run.with_params('File[/tmp/a]', 'ensure' => 'present', 'owner' => undef_value).and_return(true) }
=======
    it { is_expected.to run.with_params('File[/tmp/a]', 'ensure' => 'present', 'owner' => :undef).and_return(true) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  end

  describe 'when the reference is a' do
    let :pre_condition do
      'user { "dan": }'
    end

    context 'with reference' do
      it { is_expected.to run.with_params(Puppet::Resource.new('User[dan]'), {}).and_return(true) }
    end
    if Puppet::Util::Package.versioncmp(Puppet.version, '4.6.0') >= 0
      context 'with array' do
        it 'fails' do
          expect {
<<<<<<< HEAD
            subject.execute(['User[dan]'], {})
          }.to raise_error(ArgumentError, %r{not understood: 'Array'})
=======
            subject.call([['User[dan]'], {}])
          }.to raise_error ArgumentError, %r{not understood: 'Array'}
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        end
      end
    end
  end

  describe 'when passed a defined type' do
    let :pre_condition do
<<<<<<< HEAD
      'define test::deftype() { } test::deftype { "foo": }'
=======
      'test::deftype { "foo": }'
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    end

    it { is_expected.to run.with_params('Test::Deftype[foo]', {}).and_return(true) }
    it { is_expected.to run.with_params('Test::Deftype[bar]', {}).and_return(false) }
    it { is_expected.to run.with_params(Puppet::Resource.new('Test::Deftype[foo]'), {}).and_return(true) }
    it { is_expected.to run.with_params(Puppet::Resource.new('Test::Deftype[bar]'), {}).and_return(false) }
<<<<<<< HEAD
  end

  describe 'when passed a class' do
    let :pre_condition do
      'class test () { } class { "test": }'
    end

    it { is_expected.to run.with_params('Class[test]', {}).and_return(true) }
    it { is_expected.to run.with_params('Class["bar"]', {}).and_return(false) }
    it { is_expected.to run.with_params('Class[bar]', {}).and_return(false) }
    it { is_expected.to run.with_params(Puppet::Resource.new('class', 'test'), {}).and_return(true) }
    it { is_expected.to run.with_params(Puppet::Resource.new('Class["bar"]'), {}).and_return(false) }
    it { is_expected.to run.with_params(Puppet::Resource.new('Class[bar]'), {}).and_return(false) }
=======
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  end
end
