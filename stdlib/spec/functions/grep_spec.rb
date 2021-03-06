require 'spec_helper'

describe 'grep' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it {
    pending('grep does not actually check this, and raises NoMethodError instead')
    is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError, %r{first argument not an array})
  }
  it {
    pending('grep does not actually check this, and raises NoMethodError instead')
    is_expected.to run.with_params(1, 'two').and_raise_error(Puppet::ParseError, %r{first argument not an array})
  }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError, %r{wrong number of arguments}i) }
  it { is_expected.to run.with_params([], 'two').and_return([]) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['one', 'two', 'three'], 'two').and_return(['two']) }
  it { is_expected.to run.with_params(['one', 'two', 'three'], 't(wo|hree)').and_return(['two', 'three']) }
  it { is_expected.to run.with_params(['ờאּê', 'ţשּׂỡ', 'ţһŗəè'], 'ţ(שּׂỡ|һŗəè)').and_return(['ţשּׂỡ', 'ţһŗəè']) }
=======
  it { is_expected.to run.with_params(%w[one two three], 'two').and_return(['two']) }
  it { is_expected.to run.with_params(%w[one two three], 't(wo|hree)').and_return(%w[two three]) }
  it { is_expected.to run.with_params(%w[ờאּê ţשּׂỡ ţһŗəè], 'ţ(שּׂỡ|һŗəè)').and_return(%w[ţשּׂỡ ţһŗəè]) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
