require 'spec_helper'

describe 'intersection' do
  it { is_expected.not_to eq(nil) }
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 'two').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', 'two', 'three').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params('one', []).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([], 'two').and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params({}, {}).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([], []).and_return([]) }
  it { is_expected.to run.with_params([], ['one']).and_return([]) }
  it { is_expected.to run.with_params(['one'], []).and_return([]) }
  it { is_expected.to run.with_params(['one'], ['one']).and_return(['one']) }
<<<<<<< HEAD
  it { is_expected.to run.with_params(['one', 'two', 'three'], ['two', 'three']).and_return(['two', 'three']) }
  it { is_expected.to run.with_params(['ōŋể', 'ŧשợ', 'ţђŕẽё'], ['ŧשợ', 'ţђŕẽё']).and_return(['ŧשợ', 'ţђŕẽё']) }
  it { is_expected.to run.with_params(['one', 'two', 'two', 'three'], ['two', 'three']).and_return(['two', 'three']) }
  it { is_expected.to run.with_params(['one', 'two', 'three'], ['two', 'two', 'three']).and_return(['two', 'three']) }
  it { is_expected.to run.with_params(['one', 'two', 'three'], ['two', 'three', 'four']).and_return(['two', 'three']) }
  it 'does not confuse types' do is_expected.to run.with_params(['1', '2', '3'], [1, 2]).and_return([]) end
=======
  it { is_expected.to run.with_params(%w[one two three], %w[two three]).and_return(%w[two three]) }
  it { is_expected.to run.with_params(%w[ōŋể ŧשợ ţђŕẽё], %w[ŧשợ ţђŕẽё]).and_return(%w[ŧשợ ţђŕẽё]) }
  it { is_expected.to run.with_params(%w[one two two three], %w[two three]).and_return(%w[two three]) }
  it { is_expected.to run.with_params(%w[one two three], %w[two two three]).and_return(%w[two three]) }
  it { is_expected.to run.with_params(%w[one two three], %w[two three four]).and_return(%w[two three]) }
  it 'does not confuse types' do is_expected.to run.with_params(%w[1 2 3], [1, 2]).and_return([]) end
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
end
