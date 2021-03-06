require 'spec_helper'

describe 'concat' do
  it { is_expected.not_to eq(nil) }
<<<<<<< HEAD
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params([1]).and_raise_error(Puppet::ParseError, %r{Wrong number of arguments}) }
  it { is_expected.to run.with_params(1, [2]).and_raise_error(Puppet::ParseError, %r{Requires array}) }
  it { is_expected.to run.with_params([1], [2], [3]).and_return([1, 2, 3]) }
  it { is_expected.to run.with_params(['1', '2', '3'], ['4', '5', '6']).and_return(['1', '2', '3', '4', '5', '6']) }
  it { is_expected.to run.with_params(['1', '2', '3'], '4').and_return(['1', '2', '3', '4']) }
  it { is_expected.to run.with_params(['1', '2', '3'], [['4', '5'], '6']).and_return(['1', '2', '3', ['4', '5'], '6']) }
  it { is_expected.to run.with_params(['1', '2'], ['3', '4'], ['5', '6']).and_return(['1', '2', '3', '4', '5', '6']) }
  it { is_expected.to run.with_params(['1', '2'], '3', '4', ['5', '6']).and_return(['1', '2', '3', '4', '5', '6']) }

  context 'with UTF8 and double byte characters' do
    it { is_expected.to run.with_params([{ 'a' => 'b' }], 'c' => 'd', 'e' => 'f').and_return([{ 'a' => 'b' }, { 'c' => 'd', 'e' => 'f' }]) }
    it { is_expected.to run.with_params(['ấ', 'β', '©'], ['đ', 'ể', '文字列']).and_return(['ấ', 'β', '©', 'đ', 'ể', '文字列']) }
  end

  arguments = [['1', '2', '3'], ['4', '5', '6']]
  originals = [arguments[0].dup, arguments[1].dup]
  it 'leaves the original array intact' do
    _result = subject.execute(arguments[0], arguments[1])
=======
  it { is_expected.to run.with_params.and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([1]).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params(1, [2]).and_raise_error(Puppet::ParseError) }
  it { is_expected.to run.with_params([1], [2], [3]).and_return([1, 2, 3]) }
  it { is_expected.to run.with_params(%w[1 2 3], %w[4 5 6]).and_return(%w[1 2 3 4 5 6]) }
  it { is_expected.to run.with_params(%w[1 2 3], '4').and_return(%w[1 2 3 4]) }
  it { is_expected.to run.with_params(%w[1 2 3], [%w[4 5], '6']).and_return(['1', '2', '3', %w[4 5], '6']) }
  it { is_expected.to run.with_params(%w[1 2], %w[3 4], %w[5 6]).and_return(%w[1 2 3 4 5 6]) }
  it { is_expected.to run.with_params(%w[1 2], '3', '4', %w[5 6]).and_return(%w[1 2 3 4 5 6]) }

  context 'with UTF8 and double byte characters' do
    it { is_expected.to run.with_params([{ 'a' => 'b' }], 'c' => 'd', 'e' => 'f').and_return([{ 'a' => 'b' }, { 'c' => 'd', 'e' => 'f' }]) }
    it { is_expected.to run.with_params(['ấ', 'β', '©'], %w[đ ể 文字列]).and_return(['ấ', 'β', '©', 'đ', 'ể', '文字列']) }
  end

  arguments = [%w[1 2 3], %w[4 5 6]]
  originals = [arguments[0].dup, arguments[1].dup]
  it 'leaves the original array intact' do
    _result = subject.call([arguments[0], arguments[1]])
>>>>>>> d641f2a4d90b30f3fbe3cf853c4c9f86e0a3387b
    arguments.each_with_index do |argument, index|
      expect(argument).to eq(originals[index])
    end
  end
end
