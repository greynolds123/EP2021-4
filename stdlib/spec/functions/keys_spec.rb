require 'spec_helper'

describe 'keys', :if => Puppet::Util::Package.versioncmp(Puppet.version, '5.5.0') < 0 do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it {
    pending('Current implementation ignores parameters after the first.')
    is_expected.to run.with_params({}, {}).and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i)
  }
  it { is_expected.to run.with_params('').and_raise_error(Puppet::ParseError, %r{Requires hash to work with}) }
  it { is_expected.to run.with_params(1).and_raise_error(Puppet::ParseError, %r{Requires hash to work with}) }
  it { is_expected.to run.with_params([]).and_raise_error(Puppet::ParseError, %r{Requires hash to work with}) }
  it { is_expected.to run.with_params({}).and_return([]) }
  it { is_expected.to run.with_params('key' => 'value').and_return(['key']) }
  it 'returns the array of keys' do
    result = subject.call([{ 'key1' => 'value1', 'key2' => 'value2' }])
    expect(result).to match_array(%w[key1 key2])
  end

  it 'runs with UTF8 and double byte characters' do
    result = subject.call([{ 'ҝểү' => '√ẳŀμệ', 'キー' => '値' }])
    expect(result).to match_array(%w[ҝểү キー])
  end

  it 'runs with UTF8 and double byte characters' do
    result = subject.call([{ 'ҝểү' => '√ẳŀμệ', 'キー' => '値' }])
    expect(result).to match_array(['ҝểү', 'キー'])
  end
end
