require 'spec_helper'

if Puppet::Util::Package.versioncmp(Puppet.version, '4.5.0') >= 0
  describe 'Stdlib::Compat::Absolute_path' do
    describe 'valid paths handling' do
<<<<<<< HEAD
      ['C:/', 'C:\\', 'C:\\WINDOWS\\System32', 'C:/windows/system32', 'X:/foo/bar', 'X:\\foo\\bar', '\\\\host\\windows', '//host/windows', '/', '/var/tmp', '/var/opt/../lib/puppet',
       '/var/opt//lib/puppet', '/var/ůťƒ8', '/var/ネット'].each do |value|
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
        /var/opt//lib/puppet
        /var/ůťƒ8
        /var/ネット
      ].each do |value|
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
        describe value.inspect do
          it { is_expected.to allow_value(value) }
        end
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
        ].each do |value|
          describe value.inspect do
            it { is_expected.not_to allow_value(value) }
          end
        end
      end

      context 'with relative paths' do
<<<<<<< HEAD
        ['relative1', '.', '..', './foo', '../foo', 'etc/puppetlabs/puppet', 'opt/puppet/bin', 'relative\\windows', '\\var\\ůťƒ8', '\\var\\ネット'].each do |value|
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
          \var\ůťƒ8
          \var\ネット
        ].each do |value|
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
          describe value.inspect do
            it { is_expected.not_to allow_value(value) }
          end
        end
      end
    end
  end
end
