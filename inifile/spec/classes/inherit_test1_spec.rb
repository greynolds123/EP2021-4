require 'spec_helper'
# We can't really test much here, apart from the type roundtrips though the
# parser OK.
describe 'inherit_test1' do
  it {
<<<<<<< HEAD
    is_expected.to contain_inherit_ini_setting('valid_type').with('value' => 'true')
=======
    should contain_inherit_ini_setting('valid_type').with({
      'value' => 'true',
    })
>>>>>>> 5e3f5c76a39b399f8ca3eee5196911b7889828ed
  }
end
