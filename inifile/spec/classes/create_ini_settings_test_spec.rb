require 'spec_helper'
# end-to-end test of the create_init_settings function
describe 'create_ini_settings_test' do
<<<<<<< HEAD
  it { is_expected.to have_ini_setting_resource_count(3) }
  it {
    is_expected.to contain_ini_setting('/tmp/foo.ini [section1] setting1').with(
      ensure: 'present', section: 'section1',
      setting: 'setting1', value: 'val1',
      path: '/tmp/foo.ini'
    )
  }
  it {
    is_expected.to contain_ini_setting('/tmp/foo.ini [section2] setting2').with(
      ensure: 'present', section: 'section2',
      setting: 'setting2', value: 'val2',
      path: '/tmp/foo.ini'
    )
  }
  it {
    is_expected.to contain_ini_setting('/tmp/foo.ini [section2] setting3').with(
      ensure: 'absent', section: 'section2',
      setting: 'setting3', path: '/tmp/foo.ini'
    )
  }
=======
  it { should have_ini_setting_resource_count(3) }
  it { should contain_ini_setting('/tmp/foo.ini [section1] setting1').with(
    :ensure  => 'present',
    :section => 'section1',
    :setting => 'setting1',
    :value   => 'val1',
    :path    => '/tmp/foo.ini'
  )}
  it { should contain_ini_setting('/tmp/foo.ini [section2] setting2').with(
    :ensure  => 'present',
    :section => 'section2',
    :setting => 'setting2',
    :value   => 'val2',
    :path    => '/tmp/foo.ini'
  )}
  it { should contain_ini_setting('/tmp/foo.ini [section2] setting3').with(
    :ensure  => 'absent',
    :section => 'section2',
    :setting => 'setting3',
    :path    => '/tmp/foo.ini'
  )}
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
end
