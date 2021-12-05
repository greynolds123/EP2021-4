require 'spec_helper'

describe 'hash' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it {
    pending('Current implementation ignores parameters after the first.')
    is_expected.to run.with_params([], 'two').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i)
  }
  it { is_expected.to run.with_params(['one']).and_raise_error(Puppet::ParseError, %r{Unable to compute}) }
  it { is_expected.to run.with_params([]).and_return({}) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['key1', 'value1']).and_return('key1' => 'value1') }
  it { is_expected.to run.with_params(['κ℮ұ1', '√āĺűẻ1']).and_return('κ℮ұ1' => '√āĺűẻ1') }
  it { is_expected.to run.with_params(['key1', 'value1', 'key2', 'value2']).and_return('key1' => 'value1', 'key2' => 'value2') }
=======
  it { is_expected.to run.with_params(%w[key1 value1]).and_return('key1' => 'value1') }
  it { is_expected.to run.with_params(['κ℮ұ1', '√āĺűẻ1']).and_return('κ℮ұ1' => '√āĺűẻ1') }
  it { is_expected.to run.with_params(%w[key1 value1 key2 value2]).and_return('key1' => 'value1', 'key2' => 'value2') }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
