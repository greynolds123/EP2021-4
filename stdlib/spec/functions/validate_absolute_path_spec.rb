require 'spec_helper'

describe 'validate_absolute_path' do
  after(:each) do
    ENV.delete('STDLIB_LOG_DEPRECATIONS')
  end

  # Checking for deprecation warning
  it 'displays a single deprecation' do
    ENV['STDLIB_LOG_DEPRECATIONS'] = 'true'
<<<<<<< HEAD
    expect(scope).to receive(:warning).with(include('This method is deprecated'))
=======
    scope.expects(:warning).with(includes('This method is deprecated'))
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    is_expected.to run.with_params('c:/')
  end

  describe 'signature validation' do
    it { is_expected.not_to eq(nil) }
    it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  end

  describe 'valid paths handling' do
<<<<<<< HEAD
    ['C:/', 'C:\\', 'C:\\WINDOWS\\System32', 'C:/windows/system32', 'X:/foo/bar', 'X:\\foo\\bar', '\\\\host\\windows', '//host/windows', '/', '/var/tmp', '/var/opt/../lib/puppet'].each do |path|
=======
    %w[
      C:/
      C:\\
      C:\\WINDOWS\\System32
      C:/windows/system32
      X:/foo/bar
      X:\\foo\\bar
      \\\\host\\windows
      //host/windows
      /
      /var/tmp
      /var/opt/../lib/puppet
    ].each do |path|
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
      it { is_expected.to run.with_params(path) }
      it { is_expected.to run.with_params(['/tmp', path]) }
    end
  end

  describe 'invalid path handling' do
    context 'with garbage inputs' do
      [
        nil,
        [nil],
        [nil, nil],
        { 'foo' => 'bar' },
        {},
        '',
      ].each do |path|
        it { is_expected.to run.with_params(path).and_raise_error(Puppet::ParseError, %r{is not an absolute path}) }
        it { is_expected.to run.with_params([path]).and_raise_error(Puppet::ParseError, %r{is not an absolute path}) }
        it { is_expected.to run.with_params(['/tmp', path]).and_raise_error(Puppet::ParseError, %r{is not an absolute path}) }
      end
    end

    context 'with relative paths' do
<<<<<<< HEAD
      ['relative1', '.', '..', './foo', '../foo', 'etc/puppetlabs/puppet', 'relative\\windows'].each do |path|
=======
      %w[
        relative1
        .
        ..
        ./foo
        ../foo
        etc/puppetlabs/puppet
        opt/puppet/bin
        relative\\windows
      ].each do |path|
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        it { is_expected.to run.with_params(path).and_raise_error(Puppet::ParseError, %r{is not an absolute path}) }
        it { is_expected.to run.with_params([path]).and_raise_error(Puppet::ParseError, %r{is not an absolute path}) }
        it { is_expected.to run.with_params(['/tmp', path]).and_raise_error(Puppet::ParseError, %r{is not an absolute path}) }
      end
    end
  end
end
