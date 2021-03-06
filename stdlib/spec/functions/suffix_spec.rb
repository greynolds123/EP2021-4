require 'spec_helper'

describe 'suffix' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it {
    pending('Current implementation ignores parameters after the second.')
    is_expected.to run.with_params([], 'a', '').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i)
  }
  it { is_expected.to run.with_params('', '').and_raise_error(Puppet::ParseError, %r{expected first argument to be an Array}) }
  it { is_expected.to run.with_params([], 2).and_raise_error(Puppet::ParseError, %r{expected second argument to be a String}) }
  it { is_expected.to run.with_params([]).and_return([]) }
  it { is_expected.to run.with_params(['one', 2]).and_return(%w[one 2]) }
  it { is_expected.to run.with_params([], '').and_return([]) }
  it { is_expected.to run.with_params([''], '').and_return(['']) }
  it { is_expected.to run.with_params(['one'], 'post').and_return(['onepost']) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['one', 'two', 'three'], 'post').and_return(['onepost', 'twopost', 'threepost']) }
  it { is_expected.to run.with_params(['ỗńέ', 'ťשׂǿ', 'ŧҺř℮ə'], 'рổŝţ').and_return(['ỗńέрổŝţ', 'ťשׂǿрổŝţ', 'ŧҺř℮əрổŝţ']) }

  it { is_expected.to run.with_params({}).and_return({}) }
  it { is_expected.to run.with_params('key1' => 'value1', 2 => 3).and_return('key1' => 'value1', '2' => 3) }
  it { is_expected.to run.with_params({}, '').and_return({}) }
  it { is_expected.to run.with_params({ 'key' => 'value' }, '').and_return('key' => 'value') }
  it { is_expected.to run.with_params({ 'key' => 'value' }, 'post').and_return('keypost' => 'value') }
=======
  it { is_expected.to run.with_params(%w[one two three], 'post').and_return(%w[onepost twopost threepost]) }
  it { is_expected.to run.with_params(['ỗńέ', 'ťשׂǿ', 'ŧҺř℮ə'], 'рổŝţ').and_return(['ỗńέрổŝţ', 'ťשׂǿрổŝţ', 'ŧҺř℮əрổŝţ']) }

  it {
    is_expected.to run.with_params({}).and_return({})
  }
  it {
    is_expected.to run.with_params('key1' => 'value1', 2 => 3).and_return('key1' => 'value1', '2' => 3)
  }
  it {
    is_expected.to run.with_params({}, '').and_return({})
  }
  it {
    is_expected.to run.with_params({ 'key' => 'value' }, '').and_return('key' => 'value')
  }
  it {
    is_expected.to run.with_params({ 'key' => 'value' }, 'post').and_return('keypost' => 'value')
  }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it {
    is_expected.to run \
      .with_params({ 'key1' => 'value1', 'key2' => 'value2', 'key3' => 'value3' }, 'post') \
      .and_return('key1post' => 'value1', 'key2post' => 'value2', 'key3post' => 'value3')
  }
end
