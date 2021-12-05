require 'spec_helper'

describe 'difference' do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError, %r{Requires 2 arrays}) }
  it { is_expected.to run.with_params('one', []).and_raise_error(Puppet::ParseError, %r{Requires 2 arrays}) }
  it { is_expected.to run.with_params({}, {}).and_raise_error(Puppet::ParseError, %r{Requires 2 arrays}) }

=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', []).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([], 'two').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params({}, {}).and_raise_error(Puppet::ParseError) }
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
  it { is_expected.to run.with_params([], []).and_return([]) }
  it { is_expected.to run.with_params([], ['one']).and_return([]) }
  it { is_expected.to run.with_params(['one'], ['one']).and_return([]) }
  it { is_expected.to run.with_params(['ớņέ'], ['']).and_return(['ớņέ']) }
  it { is_expected.to run.with_params(['one'], []).and_return(['one']) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['one', 'two', 'three'], ['two', 'three']).and_return(['one']) }
  it { is_expected.to run.with_params(['ớņέ', 'ŧשּׁō', 'ŧħґëə', 2], ['ŧשּׁō', 'ŧħґëə']).and_return(['ớņέ', 2]) }
  it { is_expected.to run.with_params(['one', 'two', 'two', 'three'], ['two', 'three']).and_return(['one']) }
  it { is_expected.to run.with_params(['one', 'two', 'three'], ['two', 'two', 'three']).and_return(['one']) }
  it { is_expected.to run.with_params(['one', 'two', 'three'], ['two', 'three', 'four']).and_return(['one']) }
  it 'does not confuse types' do is_expected.to run.with_params(['1', '2', '3'], [1, 2]).and_return(['1', '2', '3']) end
=======
  it { is_expected.to run.with_params(%w[one two three], %w[two three]).and_return(['one']) }
  it { is_expected.to run.with_params(['ớņέ', 'ŧשּׁō', 'ŧħґëə', 2], %w[ŧשּׁō ŧħґëə]).and_return(['ớņέ', 2]) }
  it { is_expected.to run.with_params(%w[one two two three], %w[two three]).and_return(['one']) }
  it { is_expected.to run.with_params(%w[one two three], %w[two two three]).and_return(['one']) }
  it { is_expected.to run.with_params(%w[one two three], %w[two three four]).and_return(['one']) }
  it 'does not confuse types' do is_expected.to run.with_params(%w[1 2 3], [1, 2]).and_return(%w[1 2 3]) end
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
